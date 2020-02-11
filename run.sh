#! /bin/bash
# cd repos/invariant_information_clustering
ml Anaconda3
source activate invariant_information_clustering
ml cuda90/toolkit

export CUDA_VISIBLE_DEVICES=0,1,2,3
python -m code.scripts.segmentation.segmentation_twohead --mode IID --dataset Coco164kCuratedFew --dataset_root /data/user/wwarr/repos/invariant_information_clustering/datasets/cocostuff --out_root /data/user/wwarr/repos/invariant_information_clustering/out --fine_to_coarse_dict /data/user/wwarr/repos/invariant_information_clustering/datasets/cocostuff/fine_to_coarse_dict --model_ind 555 --arch SegmentationNet10aTwoHead --num_epochs 120 --lr 0.0001 --lamb_A 1.0 --lamb_B 1.5 --num_sub_heads 1 --batch_sz 120 --num_dataloaders 1 --use_coarse_labels --output_k_A 15 --output_k_B 3 --gt_k 3 --pre_scale_all --pre_scale_factor 0.33 --input_sz 128 --half_T_side_sparse_min 0 --half_T_side_sparse_max 0 --half_T_side_dense 10 --include_rgb  --coco_164k_curated_version 6 --use_uncollapsed_loss --batchnorm_track > gnoded1_gpu0123_m555_r1.out