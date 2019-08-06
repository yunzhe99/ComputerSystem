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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "H:/labs/OExp07-PCPU/CPU/LOAD.v";
static unsigned int ng1[] = {35U, 0U};
static unsigned int ng2[] = {33U, 0U};
static unsigned int ng3[] = {3U, 0U};
static int ng4[] = {15, 0};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {12U, 0U};
static int ng7[] = {1, 0};
static unsigned int ng8[] = {65535U, 0U};
static unsigned int ng9[] = {0U, 0U};
static int ng10[] = {31, 0};
static int ng11[] = {16, 0};
static unsigned int ng12[] = {37U, 0U};
static unsigned int ng13[] = {32U, 0U};
static int ng14[] = {7, 0};
static int ng15[] = {2, 0};
static int ng16[] = {4, 0};
static int ng17[] = {8, 0};
static unsigned int ng18[] = {16777215U, 0U};
static unsigned int ng19[] = {36U, 0U};



static void Always_9_0(char *t0)
{
    char t6[8];
    char t30[8];
    char t50[8];
    char t61[8];
    char t62[8];
    char t63[8];
    char t86[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    unsigned int t70;
    int t71;
    char *t72;
    unsigned int t73;
    int t74;
    int t75;
    char *t76;
    unsigned int t77;
    int t78;
    int t79;
    unsigned int t80;
    int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    char *t87;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(9, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(10, ng0);

LAB5:    xsi_set_current_line(11, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB17;

LAB14:    if (t18 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t6) = 1;

LAB17:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng12)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB64;

LAB61:    if (t18 != 0)
        goto LAB63;

LAB62:    *((unsigned int *)t6) = 1;

LAB64:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB88;

LAB85:    if (t18 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t6) = 1;

LAB88:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng19)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB155;

LAB152:    if (t18 != 0)
        goto LAB154;

LAB153:    *((unsigned int *)t6) = 1;

LAB155:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB156;

LAB157:
LAB158:
LAB91:
LAB67:
LAB20:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(12, ng0);

LAB13:    xsi_set_current_line(13, ng0);
    t28 = (t0 + 1368U);
    t29 = *((char **)t28);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t29, 0, 0, 32);
    goto LAB12;

LAB16:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(16, ng0);

LAB21:    xsi_set_current_line(17, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng3)));
    memset(t30, 0, 8);
    t28 = (t22 + 4);
    t29 = (t21 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t21);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t28);
    t39 = *((unsigned int *)t29);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB25;

LAB22:    if (t40 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t30) = 1;

LAB25:    t44 = (t30 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t30);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB35;

LAB32:    if (t18 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t6) = 1;

LAB35:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB36;

LAB37:
LAB38:
LAB28:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t21 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t50, 32, t4, t8, 2, t21, 32, 1);
    t22 = ((char*)((ng7)));
    memset(t61, 0, 8);
    t28 = (t50 + 4);
    t29 = (t22 + 4);
    t9 = *((unsigned int *)t50);
    t10 = *((unsigned int *)t22);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t28);
    t13 = *((unsigned int *)t29);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t28);
    t17 = *((unsigned int *)t29);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB45;

LAB42:    if (t18 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t61) = 1;

LAB45:    memset(t30, 0, 8);
    t44 = (t61 + 4);
    t23 = *((unsigned int *)t44);
    t24 = (~(t23));
    t25 = *((unsigned int *)t61);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t44) != 0)
        goto LAB48;

LAB49:    t52 = (t30 + 4);
    t31 = *((unsigned int *)t30);
    t32 = *((unsigned int *)t52);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB50;

LAB51:    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t52);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t52) > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t30) > 0)
        goto LAB56;

LAB57:    memcpy(t6, t60, 8);

LAB58:    t64 = (t0 + 1768);
    t65 = (t0 + 1768);
    t66 = (t65 + 72U);
    t67 = *((char **)t66);
    t68 = ((char*)((ng10)));
    t69 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t62, t63, t86, ((int*)(t67)), 2, t68, 32, 1, t69, 32, 1);
    t72 = (t62 + 4);
    t38 = *((unsigned int *)t72);
    t71 = (!(t38));
    t76 = (t63 + 4);
    t39 = *((unsigned int *)t76);
    t74 = (!(t39));
    t75 = (t71 && t74);
    t87 = (t86 + 4);
    t40 = *((unsigned int *)t87);
    t78 = (!(t40));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB59;

LAB60:    goto LAB20;

LAB24:    t43 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(18, ng0);

LAB29:    xsi_set_current_line(19, ng0);
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t50, 0, 8);
    t51 = (t50 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (t54 >> 0);
    *((unsigned int *)t50) = t55;
    t56 = *((unsigned int *)t53);
    t57 = (t56 >> 0);
    *((unsigned int *)t51) = t57;
    t58 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t58 & 65535U);
    t59 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t59 & 65535U);
    t60 = (t0 + 1768);
    t64 = (t0 + 1768);
    t65 = (t64 + 72U);
    t66 = *((char **)t65);
    t67 = ((char*)((ng4)));
    t68 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t61, t62, t63, ((int*)(t66)), 2, t67, 32, 1, t68, 32, 1);
    t69 = (t61 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (!(t70));
    t72 = (t62 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (!(t73));
    t75 = (t71 && t74);
    t76 = (t63 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (!(t77));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB30;

LAB31:    goto LAB28;

LAB30:    t80 = *((unsigned int *)t63);
    t81 = (t80 + 0);
    t82 = *((unsigned int *)t61);
    t83 = *((unsigned int *)t62);
    t84 = (t82 - t83);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t60, t50, t81, *((unsigned int *)t62), t85);
    goto LAB31;

LAB34:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB35;

LAB36:    xsi_set_current_line(22, ng0);

LAB39:    xsi_set_current_line(23, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 16);
    *((unsigned int *)t30) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 16);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t35 & 65535U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 65535U);
    t29 = (t0 + 1768);
    t43 = (t0 + 1768);
    t44 = (t43 + 72U);
    t51 = *((char **)t44);
    t52 = ((char*)((ng4)));
    t53 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t50, t61, t62, ((int*)(t51)), 2, t52, 32, 1, t53, 32, 1);
    t60 = (t50 + 4);
    t37 = *((unsigned int *)t60);
    t71 = (!(t37));
    t64 = (t61 + 4);
    t38 = *((unsigned int *)t64);
    t74 = (!(t38));
    t75 = (t71 && t74);
    t65 = (t62 + 4);
    t39 = *((unsigned int *)t65);
    t78 = (!(t39));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB40;

LAB41:    goto LAB38;

LAB40:    t40 = *((unsigned int *)t62);
    t81 = (t40 + 0);
    t41 = *((unsigned int *)t50);
    t42 = *((unsigned int *)t61);
    t84 = (t41 - t42);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t29, t30, t81, *((unsigned int *)t61), t85);
    goto LAB41;

LAB44:    t43 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB45;

LAB46:    *((unsigned int *)t30) = 1;
    goto LAB49;

LAB48:    t51 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB49;

LAB50:    t53 = ((char*)((ng8)));
    goto LAB51;

LAB52:    t60 = ((char*)((ng9)));
    goto LAB53;

LAB54:    xsi_vlog_unsigned_bit_combine(t6, 16, t53, 16, t60, 16);
    goto LAB58;

LAB56:    memcpy(t6, t53, 8);
    goto LAB58;

LAB59:    t41 = *((unsigned int *)t86);
    t81 = (t41 + 0);
    t42 = *((unsigned int *)t62);
    t45 = *((unsigned int *)t63);
    t84 = (t42 - t45);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t64, t6, t81, *((unsigned int *)t63), t85);
    goto LAB60;

LAB63:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB64;

LAB65:    xsi_set_current_line(28, ng0);

LAB68:    xsi_set_current_line(29, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng3)));
    memset(t30, 0, 8);
    t28 = (t22 + 4);
    t29 = (t21 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t21);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t28);
    t39 = *((unsigned int *)t29);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB72;

LAB69:    if (t40 != 0)
        goto LAB71;

LAB70:    *((unsigned int *)t30) = 1;

LAB72:    t44 = (t30 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t30);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB73;

LAB74:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB80;

LAB77:    if (t18 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t6) = 1;

LAB80:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB81;

LAB82:
LAB83:
LAB75:    goto LAB67;

LAB71:    t43 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB72;

LAB73:    xsi_set_current_line(30, ng0);

LAB76:    xsi_set_current_line(31, ng0);
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t61, 0, 8);
    t51 = (t61 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (t54 >> 0);
    *((unsigned int *)t61) = t55;
    t56 = *((unsigned int *)t53);
    t57 = (t56 >> 0);
    *((unsigned int *)t51) = t57;
    t58 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t58 & 65535U);
    t59 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t59 & 65535U);
    t60 = ((char*)((ng9)));
    xsi_vlogtype_concat(t50, 32, 32, 2U, t60, 16, t61, 16);
    t64 = (t0 + 1768);
    xsi_vlogvar_assign_value(t64, t50, 0, 0, 32);
    goto LAB75;

LAB79:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB80;

LAB81:    xsi_set_current_line(34, ng0);

LAB84:    xsi_set_current_line(35, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t50, 0, 8);
    t21 = (t50 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 16);
    *((unsigned int *)t50) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 16);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t35 & 65535U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 65535U);
    t29 = ((char*)((ng9)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t29, 16, t50, 16);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t30, 0, 0, 32);
    goto LAB83;

LAB87:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB88;

LAB89:    xsi_set_current_line(39, ng0);

LAB92:    xsi_set_current_line(40, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng7)));
    memset(t30, 0, 8);
    t28 = (t22 + 4);
    t29 = (t21 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t21);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t28);
    t39 = *((unsigned int *)t29);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB96;

LAB93:    if (t40 != 0)
        goto LAB95;

LAB94:    *((unsigned int *)t30) = 1;

LAB96:    t44 = (t30 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t30);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB97;

LAB98:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng15)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB106;

LAB103:    if (t18 != 0)
        goto LAB105;

LAB104:    *((unsigned int *)t6) = 1;

LAB106:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB107;

LAB108:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng16)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB116;

LAB113:    if (t18 != 0)
        goto LAB115;

LAB114:    *((unsigned int *)t6) = 1;

LAB116:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB117;

LAB118:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng17)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB126;

LAB123:    if (t18 != 0)
        goto LAB125;

LAB124:    *((unsigned int *)t6) = 1;

LAB126:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB127;

LAB128:
LAB129:
LAB119:
LAB109:
LAB99:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t21 = ((char*)((ng14)));
    xsi_vlog_generic_get_index_select_value(t50, 32, t4, t8, 2, t21, 32, 1);
    t22 = ((char*)((ng7)));
    memset(t61, 0, 8);
    t28 = (t50 + 4);
    t29 = (t22 + 4);
    t9 = *((unsigned int *)t50);
    t10 = *((unsigned int *)t22);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t28);
    t13 = *((unsigned int *)t29);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t28);
    t17 = *((unsigned int *)t29);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB136;

LAB133:    if (t18 != 0)
        goto LAB135;

LAB134:    *((unsigned int *)t61) = 1;

LAB136:    memset(t30, 0, 8);
    t44 = (t61 + 4);
    t23 = *((unsigned int *)t44);
    t24 = (~(t23));
    t25 = *((unsigned int *)t61);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB137;

LAB138:    if (*((unsigned int *)t44) != 0)
        goto LAB139;

LAB140:    t52 = (t30 + 4);
    t31 = *((unsigned int *)t30);
    t32 = *((unsigned int *)t52);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB141;

LAB142:    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t52);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB143;

LAB144:    if (*((unsigned int *)t52) > 0)
        goto LAB145;

LAB146:    if (*((unsigned int *)t30) > 0)
        goto LAB147;

LAB148:    memcpy(t6, t60, 8);

LAB149:    t64 = (t0 + 1768);
    t65 = (t0 + 1768);
    t66 = (t65 + 72U);
    t67 = *((char **)t66);
    t68 = ((char*)((ng10)));
    t69 = ((char*)((ng17)));
    xsi_vlog_convert_partindices(t62, t63, t86, ((int*)(t67)), 2, t68, 32, 1, t69, 32, 1);
    t72 = (t62 + 4);
    t38 = *((unsigned int *)t72);
    t71 = (!(t38));
    t76 = (t63 + 4);
    t39 = *((unsigned int *)t76);
    t74 = (!(t39));
    t75 = (t71 && t74);
    t87 = (t86 + 4);
    t40 = *((unsigned int *)t87);
    t78 = (!(t40));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB150;

LAB151:    goto LAB91;

LAB95:    t43 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB96;

LAB97:    xsi_set_current_line(41, ng0);

LAB100:    xsi_set_current_line(42, ng0);
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t50, 0, 8);
    t51 = (t50 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (t54 >> 0);
    *((unsigned int *)t50) = t55;
    t56 = *((unsigned int *)t53);
    t57 = (t56 >> 0);
    *((unsigned int *)t51) = t57;
    t58 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t58 & 255U);
    t59 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t59 & 255U);
    t60 = (t0 + 1768);
    t64 = (t0 + 1768);
    t65 = (t64 + 72U);
    t66 = *((char **)t65);
    t67 = ((char*)((ng14)));
    t68 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t61, t62, t63, ((int*)(t66)), 2, t67, 32, 1, t68, 32, 1);
    t69 = (t61 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (!(t70));
    t72 = (t62 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (!(t73));
    t75 = (t71 && t74);
    t76 = (t63 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (!(t77));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB101;

LAB102:    goto LAB99;

LAB101:    t80 = *((unsigned int *)t63);
    t81 = (t80 + 0);
    t82 = *((unsigned int *)t61);
    t83 = *((unsigned int *)t62);
    t84 = (t82 - t83);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t60, t50, t81, *((unsigned int *)t62), t85);
    goto LAB102;

LAB105:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB106;

LAB107:    xsi_set_current_line(45, ng0);

LAB110:    xsi_set_current_line(46, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 8);
    *((unsigned int *)t30) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 8);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = (t0 + 1768);
    t43 = (t0 + 1768);
    t44 = (t43 + 72U);
    t51 = *((char **)t44);
    t52 = ((char*)((ng14)));
    t53 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t50, t61, t62, ((int*)(t51)), 2, t52, 32, 1, t53, 32, 1);
    t60 = (t50 + 4);
    t37 = *((unsigned int *)t60);
    t71 = (!(t37));
    t64 = (t61 + 4);
    t38 = *((unsigned int *)t64);
    t74 = (!(t38));
    t75 = (t71 && t74);
    t65 = (t62 + 4);
    t39 = *((unsigned int *)t65);
    t78 = (!(t39));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB111;

LAB112:    goto LAB109;

LAB111:    t40 = *((unsigned int *)t62);
    t81 = (t40 + 0);
    t41 = *((unsigned int *)t50);
    t42 = *((unsigned int *)t61);
    t84 = (t41 - t42);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t29, t30, t81, *((unsigned int *)t61), t85);
    goto LAB112;

LAB115:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB116;

LAB117:    xsi_set_current_line(49, ng0);

LAB120:    xsi_set_current_line(50, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 16);
    *((unsigned int *)t30) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 16);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = (t0 + 1768);
    t43 = (t0 + 1768);
    t44 = (t43 + 72U);
    t51 = *((char **)t44);
    t52 = ((char*)((ng14)));
    t53 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t50, t61, t62, ((int*)(t51)), 2, t52, 32, 1, t53, 32, 1);
    t60 = (t50 + 4);
    t37 = *((unsigned int *)t60);
    t71 = (!(t37));
    t64 = (t61 + 4);
    t38 = *((unsigned int *)t64);
    t74 = (!(t38));
    t75 = (t71 && t74);
    t65 = (t62 + 4);
    t39 = *((unsigned int *)t65);
    t78 = (!(t39));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB121;

LAB122:    goto LAB119;

LAB121:    t40 = *((unsigned int *)t62);
    t81 = (t40 + 0);
    t41 = *((unsigned int *)t50);
    t42 = *((unsigned int *)t61);
    t84 = (t41 - t42);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t29, t30, t81, *((unsigned int *)t61), t85);
    goto LAB122;

LAB125:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB126;

LAB127:    xsi_set_current_line(53, ng0);

LAB130:    xsi_set_current_line(54, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 24);
    *((unsigned int *)t30) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 24);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = (t0 + 1768);
    t43 = (t0 + 1768);
    t44 = (t43 + 72U);
    t51 = *((char **)t44);
    t52 = ((char*)((ng14)));
    t53 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t50, t61, t62, ((int*)(t51)), 2, t52, 32, 1, t53, 32, 1);
    t60 = (t50 + 4);
    t37 = *((unsigned int *)t60);
    t71 = (!(t37));
    t64 = (t61 + 4);
    t38 = *((unsigned int *)t64);
    t74 = (!(t38));
    t75 = (t71 && t74);
    t65 = (t62 + 4);
    t39 = *((unsigned int *)t65);
    t78 = (!(t39));
    t79 = (t75 && t78);
    if (t79 == 1)
        goto LAB131;

LAB132:    goto LAB129;

LAB131:    t40 = *((unsigned int *)t62);
    t81 = (t40 + 0);
    t41 = *((unsigned int *)t50);
    t42 = *((unsigned int *)t61);
    t84 = (t41 - t42);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t29, t30, t81, *((unsigned int *)t61), t85);
    goto LAB132;

LAB135:    t43 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB136;

LAB137:    *((unsigned int *)t30) = 1;
    goto LAB140;

LAB139:    t51 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB140;

LAB141:    t53 = ((char*)((ng18)));
    goto LAB142;

LAB143:    t60 = ((char*)((ng9)));
    goto LAB144;

LAB145:    xsi_vlog_unsigned_bit_combine(t6, 24, t53, 24, t60, 24);
    goto LAB149;

LAB147:    memcpy(t6, t53, 8);
    goto LAB149;

LAB150:    t41 = *((unsigned int *)t86);
    t81 = (t41 + 0);
    t42 = *((unsigned int *)t62);
    t45 = *((unsigned int *)t63);
    t84 = (t42 - t45);
    t85 = (t84 + 1);
    xsi_vlogvar_assign_value(t64, t6, t81, *((unsigned int *)t63), t85);
    goto LAB151;

LAB154:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB155;

LAB156:    xsi_set_current_line(59, ng0);

LAB159:    xsi_set_current_line(60, ng0);
    t21 = (t0 + 1208U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng7)));
    memset(t30, 0, 8);
    t28 = (t22 + 4);
    t29 = (t21 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t21);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t28);
    t39 = *((unsigned int *)t29);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB163;

LAB160:    if (t40 != 0)
        goto LAB162;

LAB161:    *((unsigned int *)t30) = 1;

LAB163:    t44 = (t30 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t30);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB164;

LAB165:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng15)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB171;

LAB168:    if (t18 != 0)
        goto LAB170;

LAB169:    *((unsigned int *)t6) = 1;

LAB171:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB172;

LAB173:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng16)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB179;

LAB176:    if (t18 != 0)
        goto LAB178;

LAB177:    *((unsigned int *)t6) = 1;

LAB179:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB180;

LAB181:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng17)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB187;

LAB184:    if (t18 != 0)
        goto LAB186;

LAB185:    *((unsigned int *)t6) = 1;

LAB187:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB188;

LAB189:
LAB190:
LAB182:
LAB174:
LAB166:    goto LAB158;

LAB162:    t43 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB163;

LAB164:    xsi_set_current_line(61, ng0);

LAB167:    xsi_set_current_line(62, ng0);
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t61, 0, 8);
    t51 = (t61 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (t54 >> 0);
    *((unsigned int *)t61) = t55;
    t56 = *((unsigned int *)t53);
    t57 = (t56 >> 0);
    *((unsigned int *)t51) = t57;
    t58 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t58 & 255U);
    t59 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t59 & 255U);
    t60 = ((char*)((ng9)));
    xsi_vlogtype_concat(t50, 32, 32, 2U, t60, 24, t61, 8);
    t64 = (t0 + 1768);
    xsi_vlogvar_assign_value(t64, t50, 0, 0, 32);
    goto LAB166;

LAB170:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB171;

LAB172:    xsi_set_current_line(65, ng0);

LAB175:    xsi_set_current_line(66, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t50, 0, 8);
    t21 = (t50 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 8);
    *((unsigned int *)t50) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 8);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = ((char*)((ng9)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t29, 24, t50, 8);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t30, 0, 0, 32);
    goto LAB174;

LAB178:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB179;

LAB180:    xsi_set_current_line(69, ng0);

LAB183:    xsi_set_current_line(70, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t50, 0, 8);
    t21 = (t50 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 16);
    *((unsigned int *)t50) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 16);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = ((char*)((ng9)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t29, 24, t50, 8);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t30, 0, 0, 32);
    goto LAB182;

LAB186:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB187;

LAB188:    xsi_set_current_line(73, ng0);

LAB191:    xsi_set_current_line(74, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t50, 0, 8);
    t21 = (t50 + 4);
    t28 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (t31 >> 24);
    *((unsigned int *)t50) = t32;
    t33 = *((unsigned int *)t28);
    t34 = (t33 >> 24);
    *((unsigned int *)t21) = t34;
    t35 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t35 & 255U);
    t36 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t36 & 255U);
    t29 = ((char*)((ng9)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t29, 24, t50, 8);
    t43 = (t0 + 1768);
    xsi_vlogvar_assign_value(t43, t30, 0, 0, 32);
    goto LAB190;

}


extern void work_m_00000000003058357408_2377710761_init()
{
	static char *pe[] = {(void *)Always_9_0};
	xsi_register_didat("work_m_00000000003058357408_2377710761", "isim/top_isim_beh.exe.sim/work/m_00000000003058357408_2377710761.didat");
	xsi_register_executes(pe);
}
