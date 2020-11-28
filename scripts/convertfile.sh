#!/usr/bin/env bash

# set the pipeline straight
udapy read.Agldt files="$1" \
  agldt.SetSpaceAfter \
  agldt.CreateUpos \
  agldt.CreateFeats \
  .SetMember \
  .ShallowConverter \
  .ShiftArtificials \
  .SubTreeConverter with_enhanced="True" \
  .FixObj \
  .RehangPunct \
  .MakeEnhanced \
  .postprocess.FixSomePos \
  .PurgeMisc \
  .text.UpdateText \
  util.Eval doc='doc.meta["docname"]=doc.meta["loaded_from"][:-4]+".conllu"' \
  write.Conllu docname_as_file=1
