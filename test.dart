void main() {
  try {
    hi();
  } catch (e) {
    print(e);
  }
}

void hi() {
  mmm();
}

void mmm() {
  hmm();
}

void hmm() {
  throw "SHIT";
}
