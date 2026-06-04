FROM runpod/worker-comfyui:5.5.1-sdxl

RUN mkdir -p /runpod-volume/models/loras \
             /runpod-volume/models/checkpoints \
             /comfyui/models/loras \
             /comfyui/models/checkpoints

# Art Noir LoRA
RUN wget -q -O /runpod-volume/models/loras/art_noir.safetensors \
    "https://civitai.com/api/download/models/1212902?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && cp /runpod-volume/models/loras/art_noir.safetensors \
          /comfyui/models/loras/art_noir.safetensors \
    && echo "LoRA: $(ls -lh /runpod-volume/models/loras/art_noir.safetensors)"

# SDXL Base Checkpoint
RUN wget -q -O /runpod-volume/models/checkpoints/sd_xl_base_1.0.safetensors \
    "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors" \
    && cp /runpod-volume/models/checkpoints/sd_xl_base_1.0.safetensors \
          /comfyui/models/checkpoints/sd_xl_base_1.0.safetensors \
    && echo "Checkpoint: $(ls -lh /runpod-volume/models/checkpoints/sd_xl_base_1.0.safetensors)"
