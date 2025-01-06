ROOT_DIR=/scratch2/choi/data/splatter360_data
CUDA_VISIBLE_DEVICES=0 python dataset_generation/dataset_generation_different_content_mp.py \
    --dataset_name hm3d \
    --split train \
    --num_workers 8 --root_dir $ROOT_DIR \

