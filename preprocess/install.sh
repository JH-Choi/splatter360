conda create -n dataset360 python=3.8
conda activate dataset360 

pip install git+https://github.com/facebookresearch/habitat-lab.git@v0.2.2
# download linux-64/habitat-sim-0.2.2-py3.8_headless_linux_011191f65f37587f5a5452a93d840b5684593a00.tar.bz2
# wget https://anaconda.org/aihabitat/habitat-sim/0.2.2/download/linux-64/habitat-sim-0.2.2-py3.8_headless_linux_011191f65f37587f5a5452a93d840b5684593a00.tar.bz2
conda install --use-local habitat-sim-0.2.2-py3.8_headless_linux_011191f65f37587f5a5452a93d840b5684593a00.tar.bz.2

pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install -r requirements_freeze.txt
pip uninstall habitat-lab
pip install einops
