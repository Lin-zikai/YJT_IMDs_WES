Step1 : Genotype QC
---

The central script used for Step1 is `genotype.py`. Among this script, two steps were carried out, include:

1, Split multi-allelic sites to represent separate bi-allelic sites
2, Genotype quality control:
  • For homozygous reference calls: Genotype Quality < 20; Genotype Depth < 10; Genotype Depth > 200  
  • For heterozygous calls: (A1 Depth + A2 Depth)/Total Depth < 0.9; A2 Depth/Total Depth < 0.2; Genotype likelihood[ref/ref] < 20; Genotype Depth < 10; Genotype Depth > 200  
  • For homozygous alternative calls: (A1 Depth + A2 Depth)/Total Depth < 0.9; A2 Depth/Total Depth < 0.9; Genotype likelihood[ref/ref] < 20; Genotype Depth < 10; Genotype Depth > 20; Genotype Depth > 200

---

Due to the large number of files, it is not possible to process them all at once. The script `LoopforApp.sh` is used to define which files are processed each time. 

`QC_Step1.sh` sets up the necessary environment and downloads the files to be processed. It then calls `genotype.py` to handle the files, and once processed, the results are uploaded to the UKB RAP. 

---

These three scripts were originally created as an applet, but they can also be run without being made into an applet.
Due to the restrictions on the original UKB data, which require an application to access, we regret that we are unable to provide it directly.


猜测input_file文件的内容应该为以下格式
ukb23148_c1_b1_v1.vcf.gz

c为染色体1-22 XY
b为划分的人群1-96
v的话应该都是v1


文件生成脚本
#!/bin/bash

output_file="file_list.txt"

# 清空或创建输出文件
> $output_file

# 生成文件列表
for chr in {1..22}; do
  for block in {1..10}; do
    echo "ukb23148_c${chr}_b${block}_v1.vcf.gz" >> $output_file
  done
done

echo "文件列表已生成到 $output_file"
