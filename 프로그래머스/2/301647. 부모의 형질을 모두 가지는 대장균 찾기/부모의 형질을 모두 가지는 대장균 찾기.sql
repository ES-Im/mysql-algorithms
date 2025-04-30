select sonT.ID ID
     , sonT.GENOTYPE GENOTYPE
     , parentT.GENOTYPE as PARENT_GENOTYPE
 from  ECOLI_DATA sonT
inner join ECOLI_DATA parentT on sonT.PARENT_ID = parentT.ID
having sonT.GENOTYPE & parentT.GENOTYPE = parentT.GENOTYPE
order by ID ASC