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
static const char *ng0 = "H:/labs/OExp07-PCPU/IO/Counter_3_IO.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};
static int ng7[] = {0, 0, 0, 0};
static int ng8[] = {32, 0};
static unsigned int ng9[] = {1U, 0U, 0U, 0U};
static int ng10[] = {31, 0};



static void Always_43_0(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 6528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 8088);
    *((int *)t2) = 1;
    t3 = (t0 + 6560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(55, ng0);

LAB28:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 24, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:
LAB31:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5448);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB32;

LAB33:
LAB34:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB35;

LAB36:
LAB37:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(45, ng0);

LAB9:    xsi_set_current_line(45, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(47, ng0);

LAB13:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);

LAB14:    t4 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t13 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    xsi_set_current_line(49, ng0);

LAB24:    xsi_set_current_line(49, ng0);
    t11 = (t0 + 2008U);
    t12 = *((char **)t11);
    t11 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 32, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(50, ng0);

LAB25:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(51, ng0);

LAB26:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB23;

LAB21:    xsi_set_current_line(52, ng0);

LAB27:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t14 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 16777215U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 16777215U);
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t14, 0, 0, 24, 0LL);
    goto LAB23;

LAB29:    xsi_set_current_line(59, ng0);
    t12 = ((char*)((ng1)));
    t16 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t16, t12, 0, 0, 1, 0LL);
    goto LAB31;

LAB32:    xsi_set_current_line(60, ng0);
    t12 = ((char*)((ng1)));
    t16 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t16, t12, 0, 0, 1, 0LL);
    goto LAB34;

LAB35:    xsi_set_current_line(61, ng0);
    t12 = ((char*)((ng1)));
    t16 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t16, t12, 0, 0, 1, 0LL);
    goto LAB37;

}

static void Always_66_1(char *t0)
{
    char t13[8];
    char t25[16];
    char t31[8];
    char t32[8];
    char t48[8];
    char t49[8];
    char t58[8];
    char t59[8];
    char t60[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    int t70;
    int t71;
    char *t72;
    unsigned int t73;
    int t74;
    int t75;
    unsigned int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    int t81;

LAB0:    t1 = (t0 + 6776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 8104);
    *((int *)t2) = 1;
    t3 = (t0 + 6808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(66, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 3U);

LAB10:    t12 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t12, 2);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t15 == 1)
        goto LAB17;

LAB18:
LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(68, ng0);

LAB9:    xsi_set_current_line(68, ng0);
    t11 = ((char*)((ng7)));
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 33, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(71, ng0);

LAB20:    xsi_set_current_line(71, ng0);
    t16 = (t0 + 4808);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = ((char*)((ng8)));
    xsi_vlog_generic_get_index_select_value(t31, 32, t4, t12, 2, t16, 32, 1);
    t17 = ((char*)((ng1)));
    memset(t32, 0, 8);
    t18 = (t31 + 4);
    t19 = (t17 + 4);
    t6 = *((unsigned int *)t31);
    t7 = *((unsigned int *)t17);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t18);
    t10 = *((unsigned int *)t19);
    t14 = (t9 ^ t10);
    t20 = (t8 | t14);
    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t19);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t33 = (t20 & t24);
    if (t33 != 0)
        goto LAB28;

LAB25:    if (t23 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t32) = 1;

LAB28:    t27 = (t32 + 4);
    t34 = *((unsigned int *)t27);
    t35 = (~(t34));
    t36 = *((unsigned int *)t32);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB29;

LAB30:
LAB31:
LAB23:    goto LAB19;

LAB13:    xsi_set_current_line(74, ng0);

LAB33:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 3208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 3208);
    t12 = (t11 + 72U);
    t16 = *((char **)t12);
    t17 = ((char*)((ng8)));
    xsi_vlog_generic_get_index_select_value(t31, 32, t5, t16, 2, t17, 32, 1);
    t18 = ((char*)((ng1)));
    memset(t32, 0, 8);
    t19 = (t31 + 4);
    t26 = (t18 + 4);
    t6 = *((unsigned int *)t31);
    t7 = *((unsigned int *)t18);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t19);
    t10 = *((unsigned int *)t26);
    t14 = (t9 ^ t10);
    t20 = (t8 | t14);
    t21 = *((unsigned int *)t19);
    t22 = *((unsigned int *)t26);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t33 = (t20 & t24);
    if (t33 != 0)
        goto LAB37;

LAB34:    if (t23 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t32) = 1;

LAB37:    t28 = (t32 + 4);
    t34 = *((unsigned int *)t28);
    t35 = (~(t34));
    t36 = *((unsigned int *)t32);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    xsi_vlogtype_concat(t25, 33, 33, 2U, t5, 1, t4, 32);
    t11 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t11, t25, 0, 0, 33, 0LL);

LAB40:    goto LAB19;

LAB15:    xsi_set_current_line(75, ng0);

LAB41:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 3208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t31, 0, 8);
    t11 = (t31 + 4);
    t12 = (t5 + 8);
    t16 = (t5 + 12);
    t6 = *((unsigned int *)t12);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t31) = t8;
    t9 = *((unsigned int *)t16);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t11) = t14;
    t17 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t17, t31, 0, 0, 1, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    memset(t31, 0, 8);
    t16 = (t31 + 4);
    t17 = (t12 + 8);
    t18 = (t12 + 12);
    t6 = *((unsigned int *)t17);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t31) = t8;
    t9 = *((unsigned int *)t18);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t16) = t14;
    memset(t32, 0, 8);
    t19 = (t4 + 4);
    t26 = (t31 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t31);
    t22 = (t20 ^ t21);
    t23 = *((unsigned int *)t19);
    t24 = *((unsigned int *)t26);
    t33 = (t23 ^ t24);
    t34 = (t22 | t33);
    t35 = *((unsigned int *)t19);
    t36 = *((unsigned int *)t26);
    t37 = (t35 | t36);
    t38 = (~(t37));
    t42 = (t34 & t38);
    if (t42 != 0)
        goto LAB43;

LAB42:    if (t37 != 0)
        goto LAB44;

LAB45:    t28 = (t32 + 4);
    t43 = *((unsigned int *)t28);
    t44 = (~(t43));
    t45 = *((unsigned int *)t32);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng9)));
    xsi_vlog_unsigned_minus(t25, 33, t4, 33, t5, 33);
    t11 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t11, t25, 0, 0, 33, 0LL);

LAB48:    goto LAB19;

LAB17:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 3208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng9)));
    xsi_vlog_unsigned_minus(t25, 33, t5, 33, t11, 33);
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t25, 0, 0, 33, 0LL);
    goto LAB19;

LAB21:    xsi_set_current_line(71, ng0);

LAB24:    xsi_set_current_line(71, ng0);
    t26 = (t0 + 3688);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = ((char*)((ng2)));
    xsi_vlogtype_concat(t25, 33, 33, 2U, t29, 1, t28, 32);
    t30 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t30, t25, 0, 0, 33, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB23;

LAB27:    t26 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB28;

LAB29:    xsi_set_current_line(72, ng0);

LAB32:    xsi_set_current_line(72, ng0);
    t28 = (t0 + 3208);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t39 = ((char*)((ng9)));
    xsi_vlog_unsigned_minus(t25, 33, t30, 33, t39, 33);
    t40 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t40, t25, 0, 0, 33, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB31;

LAB36:    t27 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(74, ng0);
    t29 = (t0 + 3208);
    t30 = (t29 + 56U);
    t39 = *((char **)t30);
    t40 = ((char*)((ng9)));
    xsi_vlog_unsigned_minus(t25, 33, t39, 33, t40, 33);
    t41 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t41, t25, 0, 0, 33, 0LL);
    goto LAB40;

LAB43:    *((unsigned int *)t32) = 1;
    goto LAB45;

LAB44:    t27 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(76, ng0);
    t29 = (t0 + 3688);
    t30 = (t29 + 56U);
    t39 = *((char **)t30);
    memset(t49, 0, 8);
    t40 = (t49 + 4);
    t41 = (t39 + 4);
    t50 = *((unsigned int *)t39);
    t51 = (t50 >> 1);
    *((unsigned int *)t49) = t51;
    t52 = *((unsigned int *)t41);
    t53 = (t52 >> 1);
    *((unsigned int *)t40) = t53;
    t54 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t54 & 2147483647U);
    t55 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t55 & 2147483647U);
    t56 = ((char*)((ng2)));
    xsi_vlogtype_concat(t48, 32, 32, 2U, t56, 1, t49, 31);
    t57 = (t0 + 3208);
    t61 = (t0 + 3208);
    t62 = (t61 + 72U);
    t63 = *((char **)t62);
    t64 = ((char*)((ng10)));
    t65 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t58, t59, t60, ((int*)(t63)), 2, t64, 32, 1, t65, 32, 1);
    t66 = (t58 + 4);
    t67 = *((unsigned int *)t66);
    t15 = (!(t67));
    t68 = (t59 + 4);
    t69 = *((unsigned int *)t68);
    t70 = (!(t69));
    t71 = (t15 && t70);
    t72 = (t60 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (!(t73));
    t75 = (t71 && t74);
    if (t75 == 1)
        goto LAB49;

LAB50:    goto LAB48;

LAB49:    t76 = *((unsigned int *)t60);
    t77 = (t76 + 0);
    t78 = *((unsigned int *)t58);
    t79 = *((unsigned int *)t59);
    t80 = (t78 - t79);
    t81 = (t80 + 1);
    xsi_vlogvar_wait_assign_value(t57, t48, t77, *((unsigned int *)t59), t81, 0LL);
    goto LAB50;

}

static void Cont_112_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 7024U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 8);
    t8 = (t4 + 12);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t6) = t14;
    t15 = (t0 + 8248);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 1U;
    t21 = t20;
    t22 = (t5 + 4);
    t23 = *((unsigned int *)t5);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 0);
    t28 = (t0 + 8120);
    *((int *)t28) = 1;

LAB1:    return;
}

static void Cont_113_3(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 7272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 8);
    t8 = (t4 + 12);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t6) = t14;
    t15 = (t0 + 8312);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 1U;
    t21 = t20;
    t22 = (t5 + 4);
    t23 = *((unsigned int *)t5);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 0);
    t28 = (t0 + 8136);
    *((int *)t28) = 1;

LAB1:    return;
}

static void Cont_114_4(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 7520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 8);
    t8 = (t4 + 12);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t6) = t14;
    t15 = (t0 + 8376);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 1U;
    t21 = t20;
    t22 = (t5 + 4);
    t23 = *((unsigned int *)t5);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 0);
    t28 = (t0 + 8152);
    *((int *)t28) = 1;

LAB1:    return;
}

static void Cont_115_5(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 7768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 3208);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 4294967295U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 4294967295U);
    t14 = (t0 + 8440);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t3, 8);
    xsi_driver_vfirst_trans(t14, 0, 31);
    t19 = (t0 + 8168);
    *((int *)t19) = 1;

LAB1:    return;
}


extern void work_m_00000000002273492592_4210814909_init()
{
	static char *pe[] = {(void *)Always_43_0,(void *)Always_66_1,(void *)Cont_112_2,(void *)Cont_113_3,(void *)Cont_114_4,(void *)Cont_115_5};
	xsi_register_didat("work_m_00000000002273492592_4210814909", "isim/top_isim_beh.exe.sim/work/m_00000000002273492592_4210814909.didat");
	xsi_register_executes(pe);
}
