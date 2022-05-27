for (const name of ["install", "activate", "fetch"]) {
  self.addEventListener(name, event => console.log(event))
}