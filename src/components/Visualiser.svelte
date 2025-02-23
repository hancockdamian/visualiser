<script>
	import { onMount } from 'svelte';
	import * as THREE from 'three';

	let container;
	let scene, camera, renderer, particles, particleSystem;
	const particleCount = 50000; // Increase particle count for higher density
	const particleSize = 0.05; // Smaller particle size

	// Function to initialize Three.js scene
	function initThree() {
		scene = new THREE.Scene();
		camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
		camera.position.z = 5;

		renderer = new THREE.WebGLRenderer();
		renderer.setSize(window.innerWidth, window.innerHeight);
		renderer.setClearColor(0xFFF2DF); // Set background color to black
		container.appendChild(renderer.domElement);

		// Create particles
		particles = new THREE.BufferGeometry();
		const positions = [];
		const velocities = [];
		const colors = [];
		const color = new THREE.Color();

		const gridSize = Math.sqrt(particleCount);
		const spacing = particleSize; // No space between particles

		for (let i = 0; i < gridSize; i++) {
			for (let j = 0; j < gridSize; j++) {
				positions.push((i - gridSize / 2) * spacing);
				positions.push((j - gridSize / 2) * spacing);
				positions.push(0);

				velocities.push((Math.random() - 0.5) * 0.02);
				velocities.push((Math.random() - 0.5) * 0.02);
				velocities.push(0);

				// Alternate colors between light gold and light magenta
				if ((i + j) % 2 === 0) {
					color.setStyle('gray');
				} else {
					color.setStyle('lightpink');
				}
				colors.push(color.r, color.g, color.b);
			}
		}

		particles.setAttribute('position', new THREE.Float32BufferAttribute(positions, 3));
		particles.setAttribute('color', new THREE.Float32BufferAttribute(colors, 3));
		particles.setAttribute('velocity', new THREE.Float32BufferAttribute(velocities, 3));

		const particleMaterial = new THREE.PointsMaterial({
			size: particleSize,
			vertexColors: true,
		});

		particleSystem = new THREE.Points(particles, particleMaterial);
		scene.add(particleSystem);

		// Animation function
		function animate() {
			requestAnimationFrame(animate);

			const positions = particles.attributes.position.array;
			const velocities = particles.attributes.velocity.array;

			for (let i = 0; i < particleCount; i++) {
				const index = i * 3;

				// Update positions based on velocities
				positions[index] += velocities[index];
				positions[index + 1] += velocities[index + 1];

				// Bounce particles off the walls
				if (positions[index] < -5 || positions[index] > 5) {
					velocities[index] = -velocities[index];
				}
				if (positions[index + 1] < -5 || positions[index + 1] > 5) {
					velocities[index + 1] = -velocities[index + 1];
				}
			}

			particles.attributes.position.needsUpdate = true;

			// Render the scene
			renderer.render(scene, camera);
		}

		animate();
	}

	onMount(() => {
		if (container) {
			initThree();
		}
	});
</script>

<div bind:this={container} class="visualiser-container"></div>

<style>
	.visualiser-container {
		width: 100vw;
		height: 100vh;
		background: #000000;
		display: flex;
		align-items: center;
		justify-content: center;
		overflow: hidden;
	}
</style>
