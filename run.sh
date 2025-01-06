# conda activate splat360

# max_steps=100000
# output_dir="./outputs/splat360-100k/"
# # resume_path="outputs/2024-10-28/13-07-48/checkpoints/epoch_29-step_120000.ckpt"
# CUDA_VISIBLE_DEVICES=0 python -m src.main \
#     +experiment=replica_new_erp data_loader.train.batch_size=1 \
#     model.encoder.shim_patch_size=8 \
#     model.encoder.downscale_factor=8 \
#     trainer.max_steps=$max_steps \
#     output_dir=$output_dir \

# Configs
# config/experiment/hm3d.yaml => check roots, rgb_roots

# Our models are trained with 8 V100 (32GB) GPU.
max_steps=100000
output_dir="./outputs/splat360_log_depth_near0.1-100k/"
CUDA_VISIBLE_DEVICES=0 python -m src.main \
     +experiment=hm3d data_loader.train.batch_size=1 \
     model.encoder.shim_patch_size=8 \
     model.encoder.downscale_factor=8 \
     trainer.max_steps=$max_steps \
     model.encoder.depth_sampling_type="log_depth" \
     output_dir=$output_dir \
     dataset.near=0.1