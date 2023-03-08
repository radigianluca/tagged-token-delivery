/*
*  C++ Implementation: dhls
*
* Description:
*
*
* Author: Andrea Guerrieri <andrea.guerrieri@epfl.ch (C) 2019
*
* Copyright: See COPYING file that comes with this distribution
*
*/

#include <iostream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "cmd_parser.h"
#include "cmd_list.h"

#include "dhls_strings.h"

using namespace std;

#define OK	0
#define ERR	1
#define EXIT	255


int design_status = DESIGN_STATUS_BEGIN;
string command_history[MAX_HISTORY];
static int history_indx;
static int command_indx;


void fe_init ( void )
{ 
    std::cout << INIT_STRING;
    std::cout << VERSION_STRING;

    cmd_parser_init ();
}

void fe_end ( void )
{
    std::cout << EXIT_STRING << endl;
    exit ( 0 );
}

int argument_parser ( int argc, char* argv[] )
{
    int return_parse;

    if ( argc > 1 )
    {
         cout << argv[1] << endl;
         //cout << ui_cmds[CMD_SOURCE].function ( argv[1] ) << endl;
         string cmd = "source ";
         cmd += argv[1];
         cmd_parser( cmd );
         
    }

    return return_parse;
}



std::string input_cmp;
int no_prompt = 0;
int arrow_count = 0;

    
int console ()
{
        char c;
        
        system ("/bin/stty raw -echo");        
        c = getchar();
        system ("/bin/stty cooked echo");
        

        //cout << int (c) << endl;
        if ( int(c) == 27 || int(c) == 91 || int(c) == 65 || int(c) == 66 || int(c) == 67 || int(c) == 68 )
        {
            if ( ++arrow_count == 3 )
            {
            //cout << "arrow" << endl;
            arrow_count = 0;
            if ( int(c) == 65 ) // arrow -up
            {
                if ( command_indx > 0 )
                {
                    command_indx--;
                }
            }
            else 
            if (int(c) == 66) //arrow-down
            {
                if ( command_indx < history_indx )
                    command_indx++;
                
            }
            if (int(c) == 67) //arrow-right
            {
                if ( command_indx < history_indx )
                    command_indx++;
                
            }
            if (int(c) == 68) //arrow-left
            {
                if ( command_indx > 0 )
                {
                    command_indx--;
                }
                
            }
            
            
            cout << "\r                                                  ";
            cout << "\r" << CURSOR_STRING << command_history[command_indx];
            input_cmp = command_history[command_indx];
            //cout << "cmd" << command_indx << "history" << history_indx << endl;
            //goto PARSE;
            //break;
            }                
            else
            {
                no_prompt = 1;
            }
            
                return -1;
        }
        
//         if ( int(c) == 9 ) //tab
//         {
//             cout << "\r                                                  ";
//             cout << "\r" << CURSOR_STRING << endl;
//             
//             for ( indx = 0; indx < CMD_MAX; indx++ )
//             {
//                 std::cout << ui_cmds[indx].cmd << "\t" ;
//             }
//         }

    
    
        return c;
    
    
}

int main ( int argc, char* argv[] )
{

    int exit_val = 255;
    int return_parse;
        
    fe_init ( );

    return_parse = argument_parser ( argc, argv );
        
    while ( return_parse != exit_val )
    {
        bool backspace = 0;
        bool parse = 0;
        bool tab = 0;


        char c;
        if ( no_prompt != 1 )
        std::cout << CURSOR_STRING;
        
        c = console ();
        
        if ( (int) (c) == -1 )
        {
            continue;
        }
        

        #if 1
        
        if ( c == 9 )
        {            
            cout << endl;
            int count = 0;
            string autocompletion;

            for ( int indx = 0; indx < CMD_MAX; indx++ )
            {
                {
                    if ( input_cmp.compare( 0 , input_cmp.size () , ui_cmds[indx].cmd, 0, input_cmp.size () ) == 0 )
                    {
                        cout << ui_cmds[indx].cmd << " " ;
                        autocompletion = ui_cmds[indx].cmd;
                        count++;
                        tab = 1;
                        
                    }
                }
            }
            cout << endl;
            cout << "\r" << CURSOR_STRING << input_cmp;
            if ( count == 1 )
            {
                input_cmp = autocompletion;
                cout << "\r                                    ";
                cout << "\r" << CURSOR_STRING << input_cmp;
                
            }
            
        }
        #endif
        
        if ( c == 127 )
        {
            if ( input_cmp.size() > 0 ) 
            {
                input_cmp.pop_back();
            }
            cout << "\r                                       ";
            cout << "\r" << CURSOR_STRING << input_cmp;
            backspace = 1;
        }
        
         if ( ! backspace )
         {
            if ( c != 9 )
            {
                cout << c ;
            }
            no_prompt = 1;
            if ( c !='\r' && c != 9 )
            {
                input_cmp += c;
                parse = 0;
            }
            else
            {
                backspace = 0;
                if ( tab == 0 )
                {
                    parse = 1;
                }
            }
        
         }
        if ( (parse) && (!backspace) )
        {
            std::cout << endl << input_cmp << endl;
            command_history[history_indx++] = input_cmp;
            command_indx = history_indx;
            return_parse = cmd_parser ( input_cmp );
            no_prompt = 0;
            input_cmp.clear();            
        }
    }

    fe_end ();
}

