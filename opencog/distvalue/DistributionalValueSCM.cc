/*
 * DistributionalValueSCMDV.cc
 *
 * Scheme small objects (SMOBS) for attention values.
 *
 * Copyright (c) 2018 SingularityNet
 *
 * Written by Roman Treutlein <roman@singularitynet.io>
 */

#include <opencog/guile/SchemePrimitive.h>
#include <opencog/guile/SchemeSmob.h>

#include <opencog/distvalue/DistributionalValueSCM.h>
#include <opencog/types/atom_types.h>

using namespace opencog;

DistributionalValueSCM::DistributionalValueSCM()
	: ModuleWrap ("opencog distvalue") {}

void DistributionalValueSCM::init(void)
{
	define_scheme_primitive("cog-new-dv",
	                        &DistributionalValueSCM::ss_new_dv,
	                        this, "distvalue");
	define_scheme_primitive("cog-new-dv-simple",
	                        &DistributionalValueSCM::ss_new_dv_simple,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-add-evidence",
	                        &DistributionalValueSCM::ss_dv_add_evidence,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv?",
	                        &DistributionalValueSCM::ss_dv_p,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-divide",
	                        &DistributionalValueSCM::ss_dv_divide,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-sum-joint",
	                        &DistributionalValueSCM::ss_dv_sum_joint,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-get-confidence",
	                        &DistributionalValueSCM::ss_dv_get_confidence,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-conjunction",
	                        &DistributionalValueSCM::ss_dv_conjunction,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-disjunction",
	                        &DistributionalValueSCM::ss_dv_disjunction,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-negate",
	                        &DistributionalValueSCM::ss_dv_negate,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-is-empty",
	                        &DistributionalValueSCM::ss_dv_is_empty,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-is-empty",
	                        &DistributionalValueSCM::ss_cdv_is_empty,
	                        this, "distvalue");
	define_scheme_primitive("cog-new-cdv",
	                        &DistributionalValueSCM::ss_new_cdv,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-add-evidence",
	                        &DistributionalValueSCM::ss_cdv_add_evidence,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-get-confidence",
	                        &DistributionalValueSCM::ss_cdv_get_confidence,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-get-unconditional",
	                        &DistributionalValueSCM::ss_cdv_get_unconditonal,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-get-joint",
	                        &DistributionalValueSCM::ss_cdv_get_joint,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-merge",
	                        &DistributionalValueSCM::ss_cdv_merge,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-join",
	                        &DistributionalValueSCM::ss_cdv_join,
	                        this, "distvalue");

	define_scheme_primitive("cog-cdv-deduction",
	                        &DistributionalValueSCM::ss_cdv_deduction,
	                        this, "distvalue");
	define_scheme_primitive("cog-dv-merge-hi-conf",
	                        &DistributionalValueSCM::ss_dv_merge_hi_conf,
	                        this, "distvalue");
	define_scheme_primitive("cog-cdv-merge-hi-conf",
	                        &DistributionalValueSCM::ss_cdv_merge_hi_conf,
	                        this, "distvalue");
	//define_scheme_primitive("cog-cdv-cde",
	//                        &DistributionalValueSCM::ss_cdv_cde,
	//                        this, "distvalue");
}

/* ============================================================== */
ValuePtr DistributionalValueSCM::dv_to_scm (const DistributionalValuePtr& dv)
{
	return ValueCast(dv);
}

DistributionalValuePtr DistributionalValueSCM::verify_dv(ValuePtr pa, const char *subrname, int pos)
{
	DistributionalValuePtr dv(DistributionalValueCast(pa));
	return dv;
}

/**
 * Create a new distributional value based on a list of handles
 *										  and a list of counts
 */
ValuePtr DistributionalValueSCM::ss_new_dv(Handle atom)
{
	double dims = 1;
	double size = 6; //TODO: Make this configurable
	if (atom->get_type() == PRODUCT_LINK)
	{
		dims = atom->getOutgoingSet().size();
		size = pow(size, dims);
	}

	DistributionalValuePtr res = DistributionalValue::createDV(size, dims);

	return dv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_new_dv_simple(double mean, double conf)
{
	DistributionalValuePtr dv = DistributionalValue::createDV(mean, conf, false);
	return dv_to_scm(dv);
}

ValuePtr DistributionalValueSCM::ss_dv_add_evidence(ValuePtr vdv, ValuePtr vpos, double count)
{

	DistributionalValuePtr dv = verify_dv(vdv, "cog-dv-divide", 1);
	FloatValuePtr data = FloatValueCast(vpos);

	dv->add_evidence(data->value(), count);

	return dv_to_scm(dv);
}

/**
 * Return true if the scm is an distributional value
 */
SCM DistributionalValueSCM::ss_dv_p(ValuePtr s)
{
	if (nullptr == s) return SCM_BOOL_F;

	if (s->get_type() == DISTRIBUTIONAL_VALUE)
		return SCM_BOOL_T;

	return SCM_BOOL_F;
}

ValuePtr DistributionalValueSCM::ss_dv_divide(ValuePtr sdv1, ValuePtr sdv2, SCM si)
{
	DistributionalValuePtr dv1 = verify_dv(sdv1, "cog-dv-divide", 1);
	DistributionalValuePtr dv2 = verify_dv(sdv2, "cog-dv-divide", 2);
	int i = scm_to_int(si);
	ConditionalDVPtr cdv = DVFormulas::joint_to_cdv(dv1, dv2, i);
	return cdv_to_scm(cdv);
}

ValuePtr DistributionalValueSCM::ss_dv_sum_joint(ValuePtr sdv1, SCM si)
{
	DistributionalValuePtr dv1 = verify_dv(sdv1, "cog-dv-sum-joint", 1);
	int i = scm_to_int(si);
	DistributionalValuePtr dvres = DVFormulas::sum_joint(dv1, i);
	return dv_to_scm(dvres);
}

ValuePtr DistributionalValueSCM::ss_dv_conjunction(ValuePtr sdv1, ValuePtr sdv2)
{
	DistributionalValuePtr dv1 = verify_dv(sdv1, "cog-dv-conjunction", 1);
	DistributionalValuePtr dv2 = verify_dv(sdv2, "cog-dv-conjunction", 2);
	DistributionalValuePtr dvres = DVFormulas::conjunction(dv1, dv2);
	return dv_to_scm(dvres);
}

ValuePtr DistributionalValueSCM::ss_dv_disjunction(ValuePtr sdv1, ValuePtr sdv2)
{
	DistributionalValuePtr dv1 = verify_dv(sdv1, "cog-dv-disjunction", 1);
	DistributionalValuePtr dv2 = verify_dv(sdv2, "cog-dv-disjunction", 2);
	DistributionalValuePtr dvres = DVFormulas::disjunction(dv1, dv2);
	return dv_to_scm(dvres);
}

SCM DistributionalValueSCM::ss_dv_get_confidence(ValuePtr sdv)
{
	DistributionalValuePtr dv = verify_dv(sdv, "cog-dv-get-confidence", 1);
	return scm_from_double(dv->get_confidence());
}

ValuePtr DistributionalValueSCM::ss_dv_negate(ValuePtr sdv)
{
	DistributionalValuePtr dv = verify_dv(sdv, "cog-dv-negate", 1);
	return dv_to_scm(dv->mirrorLinf());
}

SCM DistributionalValueSCM::ss_dv_is_empty(ValuePtr sdv)
{
	DistributionalValuePtr dv = verify_dv(sdv, "cog-dv-is-empty", 1);
	return scm_from_bool(dv->value().elem_count() == 0);
}

/* ============================================================== */

ValuePtr DistributionalValueSCM::cdv_to_scm (const ConditionalDVPtr& cdv)
{
	return ValueCast(cdv);
}

ConditionalDVPtr DistributionalValueSCM::verify_cdv(ValuePtr pa, const char *subrname, int pos)
{
	ConditionalDVPtr cdv(ConditionalDVCast(pa));
	return cdv;
}

SCM DistributionalValueSCM::ss_cdv_is_empty(ValuePtr scdv)
{
	ConditionalDVPtr cdv = verify_cdv(scdv, "cog-cdv-is-empty", 1);
	return scm_from_bool(cdv->value().elem_count() == 0);
}

ValuePtr DistributionalValueSCM::ss_new_cdv(Handle atom)
{
	double dims = 1;
	double size = 6; //TODO: Make this configurable
	HandleSeq seq = atom->getOutgoingSet();
	if (seq[0]->get_type() == PRODUCT_LINK)
	{
		dims = seq[0]->getOutgoingSet().size();
		size = pow(size, dims);
	}

	ConditionalDVPtr res = ConditionalDV::createCDV(size, dims);

	return cdv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_cdv_add_evidence(ValuePtr vcdv, ValuePtr vpos, ValuePtr vdist)
{

	ConditionalDVPtr cdv = verify_cdv(vcdv, "cog-cdv-add-evidence", 1);
	DistributionalValuePtr dist = verify_dv(vdist, "cog-ddv-add-evidence", 1);
	FloatValuePtr data = FloatValueCast(vpos);

	cdv->add_evidence(data->value(), dist);

	return cdv_to_scm(cdv);
}

SCM DistributionalValueSCM::ss_cdv_get_confidence(ValuePtr scdv)
{
	ConditionalDVPtr cdv = verify_cdv(scdv, "cog-cdv-get-confidence", 1);
	return scm_from_double(cdv->get_confidence());
}

ValuePtr DistributionalValueSCM::ss_cdv_get_unconditonal(ValuePtr scdv, ValuePtr sdv)
{
	ConditionalDVPtr cdv = verify_cdv(scdv, "cog-cdv-get-unconditional", 1);
	DistributionalValuePtr dv = verify_dv(sdv, "cog-cdv-get-unconditional", 2);
	DistributionalValuePtr res = cdv->get_unconditional(dv);
	return dv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_cdv_get_joint(ValuePtr scdv, ValuePtr sdv)
{
	ConditionalDVPtr cdv = verify_cdv(scdv, "cog-cdv-get-joint", 1);
	DistributionalValuePtr dv = verify_dv(sdv, "cog-cdv-get-joint", 2);
	DistributionalValuePtr res = cdv->get_joint_probability(dv);
	return dv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_cdv_merge(ValuePtr scdv1, ValuePtr scdv2)
{
	ConditionalDVPtr cdv1 = verify_cdv(scdv1, "cog-cdv-merge", 1);
	ConditionalDVPtr cdv2 = verify_cdv(scdv2, "cog-cdv-merge", 2);
	ConditionalDVPtr res = cdv1->merge(cdv2);
	return cdv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_cdv_join(ValuePtr scdv1, ValuePtr scdv2)
{
	ConditionalDVPtr cdv1 = verify_cdv(scdv1, "cog-cdv-merge", 1);
	ConditionalDVPtr cdv2 = verify_cdv(scdv2, "cog-cdv-merge", 2);
	ConditionalDVPtr res = cdv1->join(cdv2);
	return cdv_to_scm(res);
}

ValuePtr DistributionalValueSCM::ss_cdv_deduction(ValuePtr scdv1, ValuePtr scdv2)
{
	ConditionalDVPtr cdv1 = verify_cdv(scdv1, "cog-cdv-deduction", 1);
	ConditionalDVPtr cdv2 = verify_cdv(scdv2, "cog-cdv-deduction", 2);
	ConditionalDVPtr res = DVFormulas::deduction(cdv1, cdv2);
	return cdv_to_scm(res);
}
//SCM DistributionalValueSCM::ss_cdv_cde(SCM scdv1, SCM scdv2)
//{
//	ConditionalDVPtr cdv1 = verify_cdv(scdv1, "cog-cdv-cde", 1);
//	ConditionalDVPtr cdv2 = verify_cdv(scdv2, "cog-cdv-cde", 2);
//	ConditionalDVPtr res = DVFormulas::consequent_disjunction_elemination(cdv1, cdv2);
//	return cdv_to_scm(res);
//}

ValuePtr DistributionalValueSCM::ss_dv_merge_hi_conf(ValuePtr sdv1, ValuePtr sdv2)
{
	DistributionalValuePtr dv1 = verify_dv(sdv1, "cog-dv-merge-hi-conf", 1);
	DistributionalValuePtr dv2 = verify_dv(sdv2, "cog-dv-merge-hi-conf", 2);
	if (dv1->get_confidence() > dv2->get_confidence())
		return sdv1;
	else
		return sdv2;
}

ValuePtr DistributionalValueSCM::ss_cdv_merge_hi_conf(ValuePtr scdv1, ValuePtr scdv2)
{
	ConditionalDVPtr cdv1 = verify_cdv(scdv1, "cog-cdv-merge-hi-conf", 1);
	ConditionalDVPtr cdv2 = verify_cdv(scdv2, "cog-cdv-merge-hi-conf", 2);
	if (cdv1->get_confidence() > cdv2->get_confidence())
		return scdv1;
	else
		return scdv2;
}

void opencog_distvalue_init(void)
{
	static DistributionalValueSCM distvalueSCM;
	distvalueSCM.module_init();
}
/* ===================== END OF FILE ============================ */
