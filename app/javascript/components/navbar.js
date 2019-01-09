const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.pages-home .navbar-batchka');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-batchka-green');
      } else {
        navbar.classList.remove('navbar-batchka-green');
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
