include { PANGOLIN_RUN } from '../../../modules/nf-core/pangolin/run/main'
include { PANGOLIN_UPDATEDATA } from '../../../modules/nf-core/pangolin/updatedata/main'

workflow RUN_PANGOLIN {
    take: 
        ch_consensus // channel from amplicon-nf.nf 

    main:

    if(params.pangolin_update_dataset) {
        PANGOLIN_UPDATEDATA('pangolin_dataset')
        PANGOLIN_RUN(ch_consensus, PANGOLIN_UPDATEDATA.out.db)
    } else {
        PANGOLIN_RUN(ch_consensus, [])
    }

    emit:
        PANGOLIN_RUN.out.report
}