/*
 * Authors: Ayatallah Elakhras
 * 			
 */
#include "ElasticPass/CircuitGenerator.h"
#include<iterator>
#include<algorithm>

/**
 * @brief This function loops over all phis that are at the loop headers and ensures that the 0th data input of the MUX comes from outside the loop and the 1st data input comes from inside the loop
 *          It will be called inside the function that converts to a special_mux_type
 * @param 
 */
// TODO: check that this function works if the loop exit condition is an output of a MUX either because the loop has multiple exits or because it is a nested loop (towards the regeneration stuff!)
void CircuitGenerator::fixLoopMuxes_inputs(ENode* enode){
    ENode* mux_sel = enode->CntrlPreds->at(0);
    //std::vector<ENode*>* mux_data_inputs;  
    ENode* mux_in0 = nullptr;
    ENode* mux_in1 = nullptr;

    if(enode->type == Phi_c) {
        // check if the 0th data input is inside or outside the loop
        if(enode->JustCntrlPreds->size() > 0) {
            assert(enode->CntrlOrderPreds->size() == 0);
            //mux_data_inputs = enode->JustCntrlPreds;
            mux_in0 = enode->JustCntrlPreds->at(0);
            mux_in1 = enode->JustCntrlPreds->at(1);
        } else {
            assert(enode->CntrlOrderPreds->size() > 0);
            //mux_data_inputs = enode->CntrlOrderPreds;
            mux_in0 = enode->CntrlOrderPreds->at(0);
            mux_in1 = enode->CntrlOrderPreds->at(1);
        }
    } else {
        assert(enode->type == Phi_n || enode->type == Phi_);
        assert(enode->CntrlPreds->size() == 3);
        //mux_data_inputs = enode->CntrlPreds;

        mux_in0 = enode->CntrlPreds->at(1);
        mux_in1 = enode->CntrlPreds->at(2);
    }

    assert(mux_in0 != nullptr && mux_in1 != nullptr);

    if(BBMap->at(enode->BB)->loop->contains(mux_in0->BB)) {
        assert(!BBMap->at(enode->BB)->loop->contains(mux_in1->BB));

        // sanity check, the flag of advanced_component must be true indicating that the vector of is_negated input is filled with the signs of the input
        assert(enode->is_advanced_component);
        assert(enode->is_negated_input->size() == 3);

        // change the sign of the SEL
        if(enode->is_negated_input->at(0)) {
            enode->is_negated_input->at(0) = false;
        } else {
            enode->is_negated_input->at(0) = true;
        }

        // swap in0 and in1
        if(enode->type == Phi_c) {
            if(enode->JustCntrlPreds->size() > 0) {
                ENode* temp = enode->JustCntrlPreds->at(0);
                enode->JustCntrlPreds->at(0) = enode->JustCntrlPreds->at(1);
                enode->JustCntrlPreds->at(1) = temp;
            } else {
                ENode* temp = enode->CntrlOrderPreds->at(0);
                enode->CntrlOrderPreds->at(0) = enode->CntrlOrderPreds->at(1);
                enode->CntrlOrderPreds->at(1) = temp;
            }
        } else {
            ENode* temp = enode->CntrlPreds->at(1);
            enode->CntrlPreds->at(1) = enode->CntrlPreds->at(2);
            enode->CntrlPreds->at(2) = temp;
        }
        /*ENode temp = *mux_in0;
        *mux_in0 = *mux_in1;
        *mux_in1 = temp;*/
    } 

}

/**
 * @brief This function connects the loopMUX directly to the loop exit condition and deletes the INIT and the constant that was feeding the INIT. 
 *          The idea is that instead of killing the original stuff of FPL'22, I just add extra functions to remove them later so that it is easier for us to get back to FPL'22 whenever we want
 * @param 
 */
void CircuitGenerator::removeINIT(std::ofstream& dbg_file, ENode* enode){
    // 1st assert that the condition (SEL) input of the enode is an INIT
    ENode* mux_init = enode->CntrlPreds->at(0);

    //dbg_file << "\nFor the MUX in BB" << BBMap->at(mux_init->BB)->Idx + 1 << " called " << getNodeDotNameNew(enode) << " and is of type " << getNodeDotTypeNew(enode) << "its SEL is a node of type: " 
               // << getNodeDotTypeNew(mux_init) << "\n";

    assert(mux_init->type == Phi_n);
    assert(mux_init->is_merge_init);

    // 2nd identify the input of the INIT that is a loop condition and assert that the other input is a constant and delete it
    assert(mux_init->CntrlPreds->size() == 2);
    ENode* init_const = nullptr;
    ENode* init_condition = nullptr;
    int cond_idx_init = -1;
    if(mux_init->CntrlPreds->at(0)->type == Cst_){
        init_const = mux_init->CntrlPreds->at(0);
        init_condition = mux_init->CntrlPreds->at(1);
        cond_idx_init = 1;

        /*dbg_file << "\n********************** Inside a new MUX *****************************\n";
        dbg_file << "The init_cond has " << init_condition->CntrlSuccs->size() << " succs and " << init_condition->CntrlPreds->size() << "preds.\n";
        dbg_file << "Here is a list of the enodes that are succs of the init_condition: \n";
        for(int i = 0; i < init_condition->CntrlSuccs->size(); i++) {
            dbg_file << getNodeDotTypeNew(init_condition->CntrlSuccs->at(i)) << ", ";
            if(mux_init == init_condition->CntrlSuccs->at(i)) {
                dbg_file << "FOUND IT!!\n";
            }
        }
        dbg_file <<"\n";*/

    } else {
        assert(mux_init->CntrlPreds->at(1)->type == Cst_);
        init_const = mux_init->CntrlPreds->at(1);
        init_condition = mux_init->CntrlPreds->at(0);
        cond_idx_init = 0;

        /*dbg_file << "\n********************** Inside a new MUX *****************************\n";
        dbg_file << "The init_cond has " << init_condition->CntrlSuccs->size() << " succs and " << init_condition->CntrlPreds->size() << "preds.\n";
        dbg_file << "Here is a list of the enodes that are succs of the init_condition: \n";
        for(int i = 0; i < init_condition->CntrlSuccs->size(); i++) {
            dbg_file << getNodeDotTypeNew(init_condition->CntrlSuccs->at(i)) << ", ";
            if(mux_init == init_condition->CntrlSuccs->at(i)) {
                dbg_file << "FOUND IT!!\n";
            }
        }
        dbg_file <<"\n";*/

    }
    assert(init_const != nullptr && init_condition != nullptr && cond_idx_init != -1);

    // erase the mux_init from the succs of the init_const only if this mux_init has no remaining succs other than the current enode
    if(mux_init->CntrlSuccs->size() == 1) {
        auto pos__ = std::find(init_const->CntrlSuccs->begin(), init_const->CntrlSuccs->end(), mux_init);
        assert(pos__ != init_const->CntrlSuccs->end());
        init_const->CntrlSuccs->erase(pos__);
    }

    // if the constant has no succs other than the INIT (AND if the INIT does not feed anything else), cut the connection between it and START and the INIT and delete it
    if(init_const->CntrlSuccs->size() == 0 && mux_init->CntrlSuccs->size() == 1) {
        // cut the connection between the predecessor of the init_const (i.e., START) and the init_const
        assert(init_const->CntrlPreds->size() == 0 &&  init_const->CntrlOrderPreds->size() == 0);
        assert(init_const->JustCntrlPreds->size() == 1);
        assert(init_const->JustCntrlPreds->at(0)->type == Start_);
        
        auto pos = std::find(init_const->JustCntrlPreds->at(0)->JustCntrlSuccs->begin(), init_const->JustCntrlPreds->at(0)->JustCntrlSuccs->end(), init_const);
        assert(pos != init_const->JustCntrlPreds->at(0)->JustCntrlSuccs->end());
        // erase the init_const from the succs of START!
        init_const->JustCntrlPreds->at(0)->JustCntrlSuccs->erase(pos);

        // clear the preds and succs of the init_const 
        init_const->JustCntrlPreds->clear();
        init_const->CntrlSuccs->clear();

        assert(init_const->CntrlSuccs->size() == 0 && init_const->CntrlPreds->size() == 0 && init_const->JustCntrlPreds->size() == 0 &&
                     init_const->JustCntrlSuccs->size() == 0 && init_const->CntrlOrderPreds->size() == 0 && init_const->CntrlOrderSuccs->size() == 0);
        // erase the init_const from the enode_dag
        auto pos_const = std::find(enode_dag->begin(), enode_dag->end(), init_const);
        assert(pos_const != enode_dag->end());
        enode_dag->erase(pos_const);
    }

    // Towards deleting the INIT

    // I need to label my MUX (i.e., enode) as an "advanced_component" and set its is_negated_input vector
    enode->is_advanced_component = true;
    // sanity checks
    assert(mux_init->is_advanced_component && mux_init->is_negated_input->size() == 2);
    enode->is_negated_input->push_back(mux_init->is_negated_input->at(cond_idx_init));
    // the 2 data inputs of the MUX are never negated!
    enode->is_negated_input->push_back(false);
    enode->is_negated_input->push_back(false);
  
    // erase the enode from the succs of the mux_init
    auto pos_ = std::find(mux_init->CntrlSuccs->begin(), mux_init->CntrlSuccs->end(), enode);
    assert(pos_ != mux_init->CntrlSuccs->end());
    mux_init->CntrlSuccs->erase(pos_);

    // push back the enode to the successors of the loop condition because there are multiple enodes and the loop condition is feeding only one INIT
            // and we will erase the connection to the INIT once in the end
    init_condition->CntrlSuccs->push_back(enode);
    if(mux_init->CntrlSuccs->size() == 0) {
        // find the INIT in the successors of the loop condition
        auto pos = std::find(init_condition->CntrlSuccs->begin(), init_condition->CntrlSuccs->end(), mux_init);
        assert(pos != init_condition->CntrlSuccs->end());
        init_condition->CntrlSuccs->erase(pos);
    }

    // replace the connection between the INIT and the enode with a direct connection between the enode and the init_condition
    enode->CntrlPreds->at(0) = init_condition;

    // check if the INIT has no other succs (it might be already connected to another MUX that still was not called in this function so must do this check), cut the connection between it and the constant and delete it!
    if(mux_init->CntrlSuccs->size() == 0) {
        mux_init->CntrlSuccs->clear();
        mux_init->CntrlPreds->clear();

        assert(mux_init->CntrlSuccs->size() == 0 && mux_init->CntrlPreds->size() == 0);
        // erase the mux_init from the enode_dag
        auto pos = std::find(enode_dag->begin(), enode_dag->end(), mux_init);
        assert(pos != enode_dag->end());
        enode_dag->erase(pos);
    } 

    
}

/**
 * @brief This function converts the type of the MUX at the loop header to a new type Loop_Phi_n to be instantiate the SPECIAL_MUX type in the backend. IN the same spirit of the above function,
 *          the idea is that instead of killing the original stuff of FPL'22, I just add extra functions to remove them later so that it is easier for us to get back to FPL'22 whenever we want
 * @param 
 * @assumptions It is important to note that this function assumes that any Phi of the three types is at the loop header if it is a loop MUX
 */
void CircuitGenerator::convert_to_special_mux(){
    std::ofstream dbg_file;
    dbg_file.open("AYA_checking_lopp_condition.txt");
    //dbg_file << "\nChecking if the flag is_merge_init is not true for all Merges used as INIT\n";
    for(auto& enode: *enode_dag) {
        if((enode->type == Phi_ || enode->type == Phi_n || enode->type == Phi_c ) && !enode->is_merge_init && !enode->is_shannons_mux) {
            if(BBMap->at(enode->BB)->is_loop_header) {   // check if this MUX is at a loop header
                // 1st: let's do some sanity checks
                assert(enode->isMux);
                if(enode->type == Phi_ || enode->type == Phi_n) {
                    assert(enode->CntrlPreds->size() == 3);
                } else {
                    assert(enode->JustCntrlPreds->size() == 2 || enode->CntrlOrderPreds->size() == 2);    
                }

                // 2nd: let's remove the INIT and its constant and make a direct connection between the loop condition and the SEL of the Phi
                removeINIT(dbg_file, enode);

                // 3rd: let's make sure that the convention of having the 0th data input coming from outside is satisfied
                fixLoopMuxes_inputs(enode);

                // 4th: let's convert the Phi to my special_mux type: Phi_n and Phi_ will be mapped to one type that will get translated to the special_mux with some data bits, whereas Phi_c will be mapped to another type to be translated to the special_mux as well but with 0 data bits..
                if(enode->type == Phi_ || enode->type == Phi_n) {
                    enode->type = Loop_Phi_n;
                } else {
                    enode->type = Loop_Phi_c;
                }
                enode->id = loop_phi_id++;
            }
        }
         
    }
}
