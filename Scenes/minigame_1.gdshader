shader_type canvas_item;

// Exposes scroll speed controls to the Godot Inspector
uniform vec2 scroll_speed = vec2(0.1, 0.0); 

void fragment() {
    // Shift the UV coordinates over time using the built-in TIME variable
    vec2 shifted_uv = UV + (scroll_speed * TIME);
    
    // Apply the shifted UVs to the TextureRect texture
    COLOR = texture(TEXTURE, shifted_uv);
}
