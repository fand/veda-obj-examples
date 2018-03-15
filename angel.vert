/*{
    frameskip: 1,
    "vertexMode": "TRIANGLES",
    "vertexMode": "POINTS",
    PASSES: [{
      OBJ: './Alucy.obj'
    }]
}*/
precision mediump float;
attribute vec3 position;
attribute vec3 normal;
attribute float vertexId;
uniform float vertexCount;
uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;
uniform sampler2D spectrum;
uniform float volume;
varying vec4 v_color;

vec2 rot(in vec2 p, in float t) {
  float s = sin(t);
  float c = cos(t);
  return mat2(s, c, -c, s) * p;
}

void main() {
  vec3 pos = position;
  pos *= .5;
  pos.xz = rot(pos.xz, time);

  // Move
  pos.x += smoothstep(-.1, .1, sin(time + pos.y * 3.) * .8) - .5;

  pos.y *= resolution.x / resolution.y;
  gl_Position = vec4(pos, 1);

  gl_PointSize = 3.;

  float y = pos.y * 3.1 + time * .2;
  v_color = vec4(normalize(normal), 1.) * vec4(
    sin(y),
    sin(y + 2.),
    sin(y + 3.),
    1.
  );
}
