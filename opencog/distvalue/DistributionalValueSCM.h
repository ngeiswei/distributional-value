/*
 * opencog/distvalue/DistributionalValueSCM.h
 *
 * Copyright (c) 2018 by SingularityNet
 * All Rights Reserved
 *
 * Written by Roman Treutlein
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License v3 as
 * published by the Free Software Foundation and including the exceptions
 * at http://opencog.org/wiki/Licenses
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program; if not, write to:
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef _OPENCOG_DISTRIBUTIONAL_VALUE_SCM_H
#define _OPENCOG_DISTRIBUTIONAL_VALUE_SCM_H

#include <opencog/distvalue/DistributionalValue.h>
#include <opencog/distvalue/ConditionalDV.h>
#include <opencog/distvalue/DVFormulas.h>

#include <opencog/guile/SchemeModule.h>

namespace opencog
{

class DistributionalValueSCM : public ModuleWrap
{

public:
	DistributionalValueSCM();

protected:
	void init(void);

	//C Value -> SCM
	ValuePtr dv_to_scm(const DistributionalValuePtr&);
	ValuePtr cdv_to_scm(const ConditionalDVPtr&);

	//SCM -> C Value
	DistributionalValuePtr verify_dv(ValuePtr, const char *, int pos = 1);
	ConditionalDVPtr verify_cdv(ValuePtr, const char *, int pos = 1);

	//SCHEME Functions
	ValuePtr ss_new_dv(Handle);
	ValuePtr ss_new_dv_simple(double, double);
	ValuePtr ss_dv_add_evidence(ValuePtr, ValuePtr, double);
	SCM ss_dv_p(ValuePtr);
	ValuePtr ss_dv_divide(ValuePtr, ValuePtr, SCM);
	ValuePtr ss_dv_sum_joint(ValuePtr, SCM);
	SCM ss_dv_get_confidence(ValuePtr);
	ValuePtr ss_dv_conjunction(ValuePtr, ValuePtr);
	ValuePtr ss_dv_disjunction(ValuePtr, ValuePtr);
	ValuePtr ss_dv_negate(ValuePtr);
	SCM ss_dv_is_empty(ValuePtr);
	SCM ss_cdv_is_empty(ValuePtr);

	ValuePtr ss_new_cdv(Handle);
	ValuePtr ss_cdv_add_evidence(ValuePtr, ValuePtr, ValuePtr);
	SCM ss_cdv_get_confidence(ValuePtr);
	ValuePtr ss_cdv_get_unconditonal(ValuePtr, ValuePtr);
	ValuePtr ss_cdv_get_joint(ValuePtr, ValuePtr);
	ValuePtr ss_cdv_merge(ValuePtr, ValuePtr);
	ValuePtr ss_cdv_join(ValuePtr, ValuePtr);
	ValuePtr ss_cdv_deduction(ValuePtr, ValuePtr);

	ValuePtr ss_dv_merge_hi_conf(ValuePtr, ValuePtr);
	ValuePtr ss_cdv_merge_hi_conf(ValuePtr, ValuePtr);
	//SCM ss_cdv_cde(SCM, SCM);

}; // class

} // namespace opencog

extern "C" {
void opencog_distvalue_init(void);
};

#endif // _OPENCOG_DISTRIBUTIONAL_VALUE_SCM_H
