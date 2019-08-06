/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002275296241_1733832700_init();
    work_m_00000000001564778030_0345418465_init();
    work_m_00000000003694468772_0621909412_init();
    work_m_00000000002191111576_0621066737_init();
    work_m_00000000002002107358_1785967555_init();
    work_m_00000000003694468772_1544356794_init();
    work_m_00000000000002136130_0103510313_init();
    work_m_00000000001414924996_1410425686_init();
    work_m_00000000003694468772_1873389809_init();
    work_m_00000000002199829654_2725559894_init();
    work_m_00000000003584826706_4024466370_init();
    work_m_00000000002584573981_0757879789_init();
    work_m_00000000003754005522_3640553057_init();
    work_m_00000000000019050620_4140825114_init();
    work_m_00000000003058357408_2377710761_init();
    work_m_00000000002951386939_2520395732_init();
    work_m_00000000002171104329_2885957937_init();
    work_m_00000000002322474646_3877310806_init();
    work_m_00000000004001671522_3343995150_init();
    work_m_00000000003647265936_0571264860_init();
    work_m_00000000004194856048_0098775010_init();
    work_m_00000000001292329324_2797238008_init();
    xilinxcorelib_ver_m_00000000001067635404_2079639763_init();
    work_m_00000000003452451064_2106884401_init();
    work_m_00000000001378423291_0219727411_init();
    work_m_00000000000865437744_4257133030_init();
    work_m_00000000004134477491_1069848932_init();
    xilinxcorelib_ver_m_00000000001358910285_2343122980_init();
    xilinxcorelib_ver_m_00000000001687936702_2843080771_init();
    xilinxcorelib_ver_m_00000000000277421008_2947863841_init();
    xilinxcorelib_ver_m_00000000001603977570_2989700712_init();
    work_m_00000000000403262735_1948799799_init();
    work_m_00000000002273492592_4210814909_init();
    work_m_00000000003774579483_3823007873_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003774579483_3823007873");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}