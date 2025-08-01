# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.1.0-base

# install custom nodes into comfyui
RUN comfy-node-install comfyui-kjnodes

# download models and put them into the correct folders in comfyui (one RUN per model)
RUN comfy model download --url https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-schnell-fp8.safetensors --relative-path models/checkpoints --filename FLUX1/flux1-schnell-fp8.safetensors
RUN comfy model download --url https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth --relative-path models/upscale_models --filename RealESRGAN_x2.pth