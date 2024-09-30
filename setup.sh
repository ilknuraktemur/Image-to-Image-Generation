conda create --name comfyui_task python=3.10
conda activate comfyui_task
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt
cd custom_nodes

#install the required custom nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
git clone https://github.com/cubiq/ComfyUI_essentials.git
cd ..
# Download the models
wget "https://civitai.com/api/download/models/288982?token=b322a285d350941032aff0739f2bcccd" -O ./ComfyUI/models/checkpoints/model2.safetensors
wget "https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-depth-rank256.safetensors" -O ./ComfyUI/models/controlnet/controlnet-depthrank.safetensors
wget "https://huggingface.co/diffusers/controlnet-canny-sdxl-1.0-mid/resolve/main/diffusion_pytorch_model.fp16.safetensors" -O ./ComfyUI/models/controlnet/controlnet-canny.safetensors

# Download the IP Adapter models
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin" -O ./ComfyUI/models/ipadapter/ip-adapter-faceid_sdxl.bin
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin" -O ./ComfyUI/models/ipadapter/ip-adapter-faceid-plusv2_sdxl.bin
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin" -O ./ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl.bin
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin" -O ./ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl_unnorm.bin
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors" -O ./ComfyUI/models/loras/ipadapter/ip-adapter-faceid_sdxl_lora.safetensors
wget "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors" -O ./ComfyUI/models/loras/ipadapter/ip-adapter-faceid-plusv2_sdxl_lora.safetensors
wget "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors" -O ./ComfyUI/models/ipadapter/ip-adapter_sdxl.safetensors
wget "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors" -O ./ComfyUI/models/ipadapter/ip-adapter_sdxl_vit-h.safetensors
wget "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors" -O ./ComfyUI/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors
wget "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors" -O ./ComfyUI/models/ipadapter/ip-adapter-plus-face_sdxl_vit-h.safetensors
wget "https://huggingface.co/ostris/ip-composition-adapter/resolve/main/ip_plus_composition_sdxl.safetensors" -O ./ComfyUI/models/ipadapter/ip_plus_composition_sdxl.safetensors
wget "https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin" -O ./ComfyUI/models/instantid/ip-adapter.bin
wget "https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin" -O ./ComfyUI/models/instantid/SDXL/ip-adapter.bin

# Download the Clip Vision models

wget "https://huggingface.co/h94/IP Adapter/resolve/main/models/image_encoder/model.safetensors" -O ./ComfyUI/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
wget "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors" -O ./ComfyUI/models/clip_vision/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors

# Clone the repository
git clone https://github.com/ilknuraktemur/Image-to-Image-Generation.git
cd Image-to-Image-Generation
python main.py --load-workflow workflow.json