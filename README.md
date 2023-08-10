# SPADE
`Only_Phase.m` numerically verifies that phase-only sorter can still have high contrast.

`Ortho_of_FT.nb` verifies the orthogonality of Fourier transforms of Zernike modes. So we can use FT of Zernike modes as an orthogonal basis.

`Generate_zernike.m` is a function that creates properly normalized (divided by $\sqrt{\pi}$) Zernike modes.

`Generate_FTzernike.m` is a function that creates intensity-normalized ($I_{\mathrm{max}}=1$) Fourier transforms of Zernike modes.

`ge_modes.m` generates `.mat` and `.bmp` files for the first 6 Zernike modes, namely $`m_1=Z^0_0`$, $`m_2=Z^1_1`$, $`m_3=Z^{-1}_1`$, $`m_4=Z^{-2}_2`$, $`m_5=Z^0_2`$, $`m_6=Z^2_2`$, and corresponding FT.

`SLM_bmp_J1Method.m` is a function that takes a complex field as input, and creates a `uint8` matrix for the phase-only SLM, such that the SLM will produce the input complex field. Note that the code (not listed here) for generating the FTzernike modes requires this function, but the code that generates sorters do not use this function.

`ge_mode1_meta.m`, `ge_mode2_meta.m`, and `ge_mode3_meta.m` create `.mat` and `.bmp` files for one-mode-only sorter. The three modes sorted by the sorter are $`M_1=\mathcal{F}\{Z^0_0\}`$, $`M_2=\mathcal{F}\{Z^1_1\}`$, $`M_3=\mathcal{F}\{ Z^{-1}_1\}`$. Since all single-mode sorters use y tilt with a period of 7 pixels, it is trivial to use these codes to generate sorters of other modes.

`ge_mode23_meta.m`, `ge_mode123_period_meta.m`, and `ge_mode123_angle_meta.m` create `.mat` and `.bmp` files for multiplexed sorter. The spatial distributions of spots depend on either different grating periods or different diffraction angles.

`ge_grating.m` creates `.mat` and `.bmp` files for gratings. No FTzernike modes are implemented.
