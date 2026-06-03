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

# Cheyenne v2.4 checkpoint
RUN wget -q -O /runpod-volume/models/checkpoints/cheyenne_v24.safetensors \
    "https://civitai.com/api/download/models/1055511?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && cp /runpod-volume/models/checkpoints/cheyenne_v24.safetensors \
          /comfyui/models/checkpoints/cheyenne_v24.safetensors \
    && echo "Checkpoint: $(ls -lh /runpod-volume/models/checkpoints/cheyenne_v24.safetensors)"
