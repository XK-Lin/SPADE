# SPADE
`Only_Phase.m` numerically verifies that phase-only sorter can still have high contrast.

`Ortho_of_FT.nb` verifies the orthogonality of Fourier transforms of Zernike modes. So we can use FT of Zernike modes as an orthogonal basis.

`Generate_zernike.m` is a function that creates properly normalized (divided by $\sqrt{\pi}$) Zernike modes.

`Generate_FTzernike.m` is a function that creates intensity-normalized ($I_{\mathrm{max}}=1$) Fourier transforms of Zernike modes.

`ge_mode1_meta.m`, `ge_mode2_meta.m`, and `ge_mode3_meta.m` create `.mat` and `.bmp` files for one-mode-only sorter. The three modes sorted by the sorter are $M_1=\mathcal{F}\{Z^0_0\}$, $M_2=\mathcal{F}\{Z^1_1\}$, $M_1=\mathcal{F} \{Z^{-1}_1 \}$.

`ge_mode23_meta.m`, `ge_mode123_period_meta.m`, and `ge_mode123_angle_meta.m` create `.mat` and `.bmp` files for multiplexed sorter. The spatial distributions of spots are either from different grating periods or different diffraction angles.

`ge_grating.m` creates `.mat` and `.bmp` files for gratings. No FTzernike modes are implemented.
