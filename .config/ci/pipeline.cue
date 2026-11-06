package ci

// The installed verification is the whole pipeline: hosted CI runs the portable full proof on
// Apple-silicon macOS. Checking a work against its repository needs that repository's checkout,
// so it runs only locally.
