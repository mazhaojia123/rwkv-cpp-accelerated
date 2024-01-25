# Port rwkv-cpp-accelerated to SYCL

1. There is only one cuda file that needed to be ported to sycl. And this file is `include/rwkv/cuda/rwkv.cu`. The migrated file is `include/rwkv/sycl/rwkv.dp.cpp`
2. Run the sycl version storygen according to the following steps. 
	```sh
	cd examples/storygen
	make sycl
	cd release
	# a model.bin file needs be placed in `converter/`
	SYCL_PI_TRACE=1 ./storygen 
	```
	We got the output below on a server equipped with one A100 GPU. 
	```
	$ SYCL_PI_TRACE=1 ./storygen-sycl
	/home/mazhaojia/repo/rwkv-cpp-accelerated/examples/storygen/release/../../../converter/model.bin
	SYCL_PI_TRACE[basic]: Plugin found and successfully loaded: libpi_opencl.so [ PluginVersion: 14.38.1 ]
	SYCL_PI_TRACE[basic]: Plugin found and successfully loaded: libpi_level_zero.so [ PluginVersion: 14.38.1 ]
	SYCL_PI_TRACE[basic]: Plugin found and successfully loaded: libpi_cuda.so [ PluginVersion: 14.38.1 ]
	SYCL_PI_TRACE[basic]: Plugin found and successfully loaded: libpi_unified_runtime.so [ PluginVersion: 14.38.1 ]
	SYCL_PI_TRACE[all]: Requested device_type: info::device_type::automatic
	SYCL_PI_TRACE[all]: Selected device: -> final score = 1500
	SYCL_PI_TRACE[all]:   platform: NVIDIA CUDA BACKEND
	SYCL_PI_TRACE[all]:   device: NVIDIA A100-PCIE-40GB
	n_layers: 24
	n_embed: 2048
	loading: xbuf
	loading: embed
	loading: layernorms
	loading: state_xy
	loading: state_aa
	loading: state_bb
	loading: state_pp
	loading: state_dd
	loading: buffer1
	loading: buffer2
	loading: buffer3
	loading: buffer4
	loading: mix_k
	loading: mix_v
	loading: mix_r
	loading: km
	loading: vm
	loading: rm
	loading: kr
	loading: vr
	loading: rr
	loading: o1
	loading: o2
	loading: o3
	loading: att_out
	loading: att_out_r
	loading: att_out_o
	loading: ffn_mix_k
	loading: ffn_mix_v
	loading: ffn_k
	loading: ffn_v
	loading: ffn_r
	loading: ffn_kr
	loading: ffn_vr
	loading: ffn_rr
	loading: ffn_ko
	loading: ffn_vo
	loading: ffn_ro
	loading: ffn_k_buffer
	loading: ffn_v_buffer
	loading: ffn_r_buffer
	loading: decay
	loading: bonus
	loading: head
	loading: head_r
	loading: head_o
	Loaded model
	loading context

	4118:token

	Press q to return

	Describe the story you want written:>
	187:token It was the Summer of Love, a time of music, love, and creativity. The hippies and young rebels were all over the beach and the Chinese New Year festivities were in full swing. The strip of palm trees and brightly colored buildings were getting fuller each day and there were unpretentious coffee shops, bookstores, and itinerant vendors with offerings of homemade snacks and sundries. The 'stars' hung out on the beach and strolled along the shores where the warm sun was dry and the water clear and golden. Life was calm but vivid and happy with the glimmer of the Pier going on before them like a curve of a blue wave.

	The waves were crashing softly and there were white clouds in the sky above. As the night grew chill, they packed the cooler with bottles of sparkling lemonade and lemonade, drinks and snacks. Sprigs of palm stood inside and outside, and the fresh scent mingled with the coolness and invited them to sit cross-legged on the sand. And then the music began, the bouncy beat of acontinue? (y/n):q


	Press q to return

	Describe the story you want written:>^C

	```

