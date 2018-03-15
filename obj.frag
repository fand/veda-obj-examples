/*{
  vertexMode: "TRIANGLES",
  PASSES: [{
    OBJ: './deer.obj',
    vs: './obj.vert',
    fs: './obj.frag',
    TARGET: 'deer',
  }, {}]
}*/
precision mediump float;
uniform float time;
uniform vec2 resolution;
uniform int PASSINDEX;
uniform sampler2D deer;

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    if (PASSINDEX == 0) {
        gl_FragColor = vec4(1);
    }
    else {
        vec4 deer = texture2D(deer, uv);
        gl_FragColor = deer;
        gl_FragColor += vec4(uv, 1, 1);
    }
}
