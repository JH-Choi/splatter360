pip install numba==0.49.1 --ignore-installed llvmlite


bash generate_hm3d_train.sh
bash generate_hm3d_test.sh

# check dataset_name, base_dir (line 18, 19) 
# change stage (line 218)
python convert_cubemaps_mp.py

# check dataset_name, base_dir (line 18, 19) 
# change stage (line 138)
python convert.py

# change line (line 7, 10) 
python generate_index.py