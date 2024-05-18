#exclude low call rates or were outliers (outside 8 s.d. from the mean) for a number of additional metrics
for i in {1..22};do
/home1/Huashan1/wbs_data/software/plink2 \
--bfile /home1/Huashan1/UKB_WES_data/QCstep2/WES_step2v2_chr${i}_qc \
--keep /home1/Huashan1/UKB_WES_data/qcstep3/non_retracted_and_sex_qc_filtered.txt \
--sample-counts 'cols'=hom,het,ts,tv,dipsingle,single,missing \
--make-just-bim \
--make-just-fam \
--out /home1/Huashan1/UKB_WES_data/qcstep3/WES_step3v1_chr${i}
done
