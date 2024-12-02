




max_steps=100000
output_dir="./outputs/splat360_log_depth_near0.1_mono_large-100k-2gpus/"

# CUDA_VISIBLE_DEVICES=0,1 python -m src.main \
#     +experiment=hm3d data_loader.train.batch_size=1 \
#     model.encoder.shim_patch_size=8 \
#     model.encoder.downscale_factor=8 \
#     trainer.max_steps=$max_steps \
#     model.encoder.depth_sampling_type="log_depth" \
#     output_dir=$output_dir \
#     dataset.near=0.1  \
#     model.encoder.vit_type=vitl \
#     model.encoder.pretrained_monodepth="./checkpoints/dinov2_vitl14_pretrain.pth"


# eval on HM3D
checkpoint_path="$output_dir/checkpoints/last.ckpt"
CUDA_VISIBLE_DEVICES=7 python -m src.main \
    +experiment=hm3d data_loader.train.batch_size=1 \
    model.encoder.shim_patch_size=8 \
    model.encoder.downscale_factor=8 \
    model.encoder.depth_sampling_type="log_depth" \
    output_dir=$output_dir \
    dataset.near=0.1  \
    model.encoder.vit_type=vitl \
    model.encoder.pretrained_monodepth="./checkpoints/dinov2_vitl14_pretrain.pth" \
    mode="test" \
    dataset/view_sampler=evaluation \
    checkpointing.load=$checkpoint_path \
    dataset.view_sampler.index_path="assets/evaluation_index_hm3d.json"

# # eval on Replica
# checkpoint_path="$output_dir/checkpoints/last.ckpt"
# CUDA_VISIBLE_DEVICES=7 python -m src.main \
#     +experiment=replica data_loader.train.batch_size=1 \
#     model.encoder.shim_patch_size=8 \
#     model.encoder.downscale_factor=8 \
#     model.encoder.depth_sampling_type="log_depth" \
#     output_dir=$output_dir \
#     dataset.near=0.1  \
#     model.encoder.vit_type=vitl \
#     model.encoder.pretrained_monodepth="./checkpoints/dinov2_vitl14_pretrain.pth" \
#     mode="test" \
#     dataset/view_sampler=evaluation \
#     checkpointing.load=$checkpoint_path \
#     dataset.view_sampler.index_path="assets/evaluation_index_replica.json"

