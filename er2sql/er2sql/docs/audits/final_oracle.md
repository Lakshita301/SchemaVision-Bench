# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 95/608.

DDL compiles: 99; all finite execution checks pass: 99; technical checks without warnings/blockers pass: 95; conversion review missing: 0.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0164 | False | 0/76 | 9 | False |
| schema_0169 | False | 0/33 | 0 | False |
| schema_0173 | False | 0/37 | 0 | False |
| schema_0177 | False | 0/22 | 0 | False |
| schema_0178 | False | 0/422 | 0 | False |
| schema_0179 | False | 0/26 | 0 | False |
| schema_0181 | False | 0/106 | 1 | False |
| schema_0183 | False | 0/49 | 14 | False |
| schema_0184 | False | 0/91 | 0 | False |
| schema_0185 | False | 0/139 | 1 | False |
| schema_0186 | False | 0/135 | 0 | False |
| schema_0190 | True | 24/24 | 0 | True |
| schema_0191 | False | 0/530 | 0 | False |
| schema_0193 | False | 0/93 | 0 | False |
| schema_0195 | False | 0/281 | 0 | False |
| schema_0196 | False | 0/719 | 0 | False |
| schema_0197 | False | 0/32 | 0 | False |
| schema_0198 | False | 0/126 | 0 | False |
| schema_0200 | True | 104/104 | 0 | True |
| schema_0204 | False | 0/219 | 0 | False |
| schema_0207 | False | 0/62 | 0 | False |
| schema_0208 | False | 0/53 | 0 | False |
| schema_0210 | False | 0/405 | 2 | False |
| schema_0217 | False | 0/67 | 0 | False |
| schema_0218 | False | 0/81 | 0 | False |
| schema_0219 | False | 0/31 | 0 | False |
| schema_0220 | False | 0/46 | 0 | False |
| schema_0221 | False | 0/76 | 0 | False |
| schema_0223 | False | 0/127 | 0 | False |
| schema_0225 | False | 0/104 | 0 | False |
| schema_0226 | False | 0/99 | 0 | False |
| schema_0228 | False | 0/188 | 0 | False |
| schema_0229 | False | 0/219 | 0 | False |
| schema_0230 | False | 0/62 | 0 | False |
| schema_0231 | False | 0/70 | 0 | False |
| schema_0238 | False | 0/60 | 0 | False |
| schema_0240 | False | 0/34 | 0 | False |
| schema_0244 | False | 0/135 | 0 | False |
| schema_0247 | False | 0/117 | 1 | False |
| schema_0248 | False | 0/135 | 0 | False |
| schema_0255 | False | 0/36 | 0 | False |
| schema_0258 | False | 0/82 | 0 | False |
| schema_0264 | False | 0/32 | 0 | False |
| schema_0266 | False | 0/203 | 0 | False |
| schema_0267 | False | 0/149 | 0 | False |
| schema_0269 | False | 0/226 | 3 | False |
| schema_0272 | False | 0/211 | 0 | False |
| schema_0273 | False | 0/430 | 0 | False |
| schema_0274 | False | 0/83 | 0 | False |
| schema_0275 | False | 0/40 | 0 | False |
| schema_0277 | False | 0/92 | 0 | False |
| schema_0279 | False | 0/318 | 5 | False |
| schema_0280 | False | 0/67 | 0 | False |
| schema_0281 | False | 0/163 | 0 | False |
| schema_0282 | False | 0/33 | 0 | False |
| schema_0284 | False | 0/18 | 0 | False |
| schema_0285 | False | 0/33 | 0 | False |
| schema_0286 | False | 0/76 | 0 | False |
| schema_0288 | False | 0/87 | 0 | False |
| schema_0289 | False | 0/73 | 0 | False |
| schema_0290 | False | 0/847 | 0 | False |
| schema_0292 | False | 0/278 | 0 | False |
| schema_0293 | False | 0/144 | 0 | False |
| schema_0294 | False | 0/26 | 0 | False |
| schema_0297 | True | 70/70 | 0 | True |
| schema_0302 | False | 0/76 | 0 | False |
| schema_0311 | False | 0/51 | 0 | False |
| schema_0314 | True | 36/36 | 0 | True |
| schema_0317 | True | 62/62 | 0 | True |
| schema_0320 | False | 0/462 | 0 | False |
| schema_0325 | True | 61/61 | 0 | True |
| schema_0327 | False | 0/23 | 0 | False |
| schema_0328 | False | 0/157 | 0 | False |
| schema_0329 | False | 0/183 | 0 | False |
| schema_0332 | False | 0/61 | 0 | False |
| schema_0333 | False | 0/94 | 0 | False |
| schema_0338 | False | 0/142 | 0 | False |
| schema_0339 | False | 0/158 | 0 | False |
| schema_0343 | False | 0/127 | 0 | False |
| schema_0345 | False | 0/127 | 0 | False |
| schema_0348 | False | 0/523 | 0 | False |
| schema_0349 | False | 0/33 | 0 | False |
| schema_0353 | False | 0/938 | 0 | False |
| schema_0360 | False | 0/54 | 0 | False |
| schema_0366 | False | 0/98 | 0 | False |
| schema_0367 | False | 0/73 | 4 | False |
| schema_0368 | False | 0/52 | 0 | False |
| schema_0369 | False | 0/20 | 0 | False |
| schema_0371 | False | 0/216 | 0 | False |
| schema_0372 | False | 0/80 | 0 | False |
| schema_0375 | False | 0/247 | 8 | False |
| schema_0376 | False | 0/102 | 0 | False |
| schema_0377 | False | 0/219 | 0 | False |
| schema_0378 | False | 0/54 | 0 | False |
| schema_0381 | True | 36/36 | 0 | True |
| schema_0383 | True | 136/136 | 0 | True |
| schema_0384 | False | 0/54 | 0 | False |
| schema_0386 | False | 0/19 | 0 | False |
| schema_0390 | False | 0/87 | 0 | False |
| schema_0391 | False | 0/44 | 0 | False |
| schema_0392 | False | 0/75 | 0 | False |
| schema_0393 | False | 0/40 | 0 | False |
| schema_0398 | False | 0/105 | 0 | False |
| schema_0400 | False | 0/48 | 0 | False |
| schema_0402 | False | 0/30 | 0 | False |
| schema_0403 | False | 0/119 | 0 | False |
| schema_0405 | False | 0/118 | 0 | False |
| schema_0406 | False | 0/570 | 1 | False |
| schema_0409 | False | 0/456 | 11 | False |
| schema_0414 | True | 47/47 | 0 | True |
| schema_0415 | False | 0/91 | 8 | False |
| schema_0419 | False | 0/32 | 0 | False |
| schema_0420 | False | 0/46 | 0 | False |
| schema_0424 | True | 33/33 | 0 | True |
| schema_0425 | False | 0/135 | 0 | False |
| schema_0431 | False | 0/132 | 0 | False |
| schema_0434 | False | 0/564 | 0 | False |
| schema_0436 | False | 0/150 | 0 | False |
| schema_0438 | False | 0/52 | 0 | False |
| schema_0440 | False | 0/130 | 0 | False |
| schema_0443 | False | 0/62 | 0 | False |
| schema_0444 | False | 0/50 | 0 | False |
| schema_0446 | True | 78/78 | 0 | True |
| schema_0449 | False | 0/45 | 0 | False |
| schema_0454 | False | 0/432 | 0 | False |
| schema_0456 | False | 0/246 | 0 | False |
| schema_0457 | True | 37/37 | 0 | True |
| schema_0459 | True | 50/50 | 0 | True |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0464 | False | 0/135 | 0 | False |
| schema_0465 | False | 0/91 | 0 | False |
| schema_0468 | True | 30/30 | 0 | True |
| schema_0469 | False | 0/149 | 0 | False |
| schema_0470 | False | 0/124 | 0 | False |
| schema_0471 | True | 218/218 | 0 | True |
| schema_0478 | True | 76/76 | 0 | True |
| schema_0481 | True | 25/25 | 0 | True |
| schema_0482 | False | 0/94 | 0 | False |
| schema_0490 | False | 0/179 | 0 | False |
| schema_0491 | False | 0/49 | 10 | False |
| schema_0493 | False | 0/486 | 0 | False |
| schema_0494 | False | 0/37 | 0 | False |
| schema_0496 | False | 0/45 | 0 | False |
| schema_0497 | False | 0/24 | 0 | False |
| schema_0503 | False | 0/525 | 0 | False |
| schema_0505 | False | 0/26 | 0 | False |
| schema_0506 | False | 0/87 | 0 | False |
| schema_0507 | False | 0/215 | 0 | False |
| schema_0511 | False | 0/136 | 0 | False |
| schema_0512 | False | 0/459 | 0 | False |
| schema_0513 | False | 0/172 | 0 | False |
| schema_0516 | True | 128/128 | 0 | True |
| schema_0517 | False | 0/22 | 0 | False |
| schema_0518 | False | 0/217 | 0 | False |
| schema_0521 | True | 54/54 | 1 | False |
| schema_0522 | False | 0/223 | 0 | False |
| schema_0527 | False | 0/278 | 0 | False |
| schema_0530 | False | 0/116 | 0 | False |
| schema_0532 | False | 0/87 | 0 | False |
| schema_0533 | False | 0/27 | 0 | False |
| schema_0535 | False | 0/289 | 0 | False |
| schema_0536 | False | 0/36 | 0 | False |
| schema_0544 | False | 0/418 | 0 | False |
| schema_0549 | False | 0/89 | 0 | False |
| schema_0551 | False | 0/200 | 0 | False |
| schema_0552 | False | 0/45 | 0 | False |
| schema_0555 | False | 0/212 | 0 | False |
| schema_0556 | False | 0/34 | 0 | False |
| schema_0560 | False | 0/552 | 2 | False |
| schema_0563 | True | 48/48 | 0 | True |
| schema_0566 | False | 0/98 | 0 | False |
| schema_0567 | False | 0/177 | 0 | False |
| schema_0570 | False | 0/481 | 0 | False |
| schema_0571 | False | 0/566 | 2 | False |
| schema_0573 | False | 0/135 | 0 | False |
| schema_0575 | False | 0/124 | 0 | False |
| schema_0577 | False | 0/32 | 0 | False |
| schema_0578 | False | 0/525 | 0 | False |
| schema_0580 | False | 0/49 | 0 | False |
| schema_0581 | True | 52/52 | 0 | True |
| schema_0585 | False | 0/157 | 0 | False |
| schema_0591 | True | 67/67 | 0 | True |
| schema_0592 | False | 0/201 | 0 | False |
| schema_0593 | False | 0/194 | 0 | False |
| schema_0597 | False | 0/87 | 0 | False |
| schema_0600 | True | 54/54 | 0 | True |
| schema_0603 | False | 0/202 | 0 | False |
| schema_0604 | False | 0/181 | 0 | False |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0611 | False | 0/67 | 0 | False |
| schema_0612 | False | 0/68 | 2 | False |
| schema_0614 | False | 0/64 | 0 | False |
| schema_0617 | True | 31/31 | 0 | True |
| schema_0620 | True | 28/28 | 0 | True |
| schema_0621 | False | 0/44 | 0 | False |
| schema_0624 | False | 0/624 | 0 | False |
| schema_0625 | False | 0/299 | 0 | False |
| schema_0627 | True | 25/25 | 0 | True |
| schema_0628 | False | 0/51 | 0 | False |
| schema_0631 | False | 0/19 | 0 | False |
| schema_0633 | False | 0/135 | 0 | False |
| schema_0639 | False | 0/64 | 0 | False |
| schema_0642 | False | 0/105 | 0 | False |
| schema_0648 | False | 0/117 | 0 | False |
| schema_0649 | True | 74/74 | 0 | True |
| schema_0651 | False | 0/392 | 0 | False |
| schema_0652 | False | 0/299 | 0 | False |
| schema_0654 | False | 0/127 | 0 | False |
| schema_0655 | False | 0/396 | 0 | False |
| schema_0659 | False | 0/27 | 0 | False |
| schema_0660 | False | 0/208 | 0 | False |
| schema_0665 | True | 41/41 | 0 | True |
| schema_0672 | False | 0/63 | 0 | False |
| schema_0673 | False | 0/97 | 0 | False |
| schema_0674 | False | 0/32 | 0 | False |
| schema_0676 | False | 0/68 | 0 | False |
| schema_0678 | True | 32/32 | 0 | True |
| schema_0681 | True | 43/43 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0684 | False | 0/300 | 0 | False |
| schema_0685 | False | 0/35 | 0 | False |
| schema_0686 | False | 0/203 | 0 | False |
| schema_0687 | False | 0/76 | 0 | False |
| schema_0688 | False | 0/32 | 0 | False |
| schema_0694 | False | 0/99 | 0 | False |
| schema_0696 | False | 0/278 | 1 | False |
| schema_0699 | False | 0/101 | 0 | False |
| schema_0701 | False | 0/134 | 0 | False |
| schema_0702 | True | 188/188 | 0 | True |
| schema_0704 | True | 129/129 | 0 | True |
| schema_0706 | False | 0/52 | 0 | False |
| schema_0724 | False | 0/33 | 0 | False |
| schema_0725 | False | 0/29 | 0 | False |
| schema_0727 | False | 0/104 | 0 | False |
| schema_0728 | True | 49/49 | 0 | True |
| schema_0731 | False | 0/79 | 0 | False |
| schema_0732 | False | 0/113 | 0 | False |
| schema_0733 | True | 48/48 | 0 | True |
| schema_0734 | False | 0/25 | 0 | False |
| schema_0737 | False | 0/102 | 0 | False |
| schema_0738 | False | 0/101 | 0 | False |
| schema_0740 | False | 0/462 | 0 | False |
| schema_0742 | False | 0/743 | 1 | False |
| schema_0745 | False | 0/283 | 0 | False |
| schema_0751 | False | 0/34 | 0 | False |
| schema_0755 | False | 0/104 | 0 | False |
| schema_0756 | False | 0/140 | 0 | False |
| schema_0761 | False | 0/209 | 0 | False |
| schema_0762 | False | 0/361 | 0 | False |
| schema_0764 | False | 0/70 | 0 | False |
| schema_0772 | False | 0/179 | 1 | False |
| schema_0775 | False | 0/55 | 0 | False |
| schema_0777 | False | 0/76 | 0 | False |
| schema_0781 | False | 0/190 | 0 | False |
| schema_0782 | False | 0/30 | 0 | False |
| schema_0784 | False | 0/45 | 0 | False |
| schema_0786 | False | 0/84 | 0 | False |
| schema_0788 | False | 0/352 | 0 | False |
| schema_0790 | False | 0/123 | 0 | False |
| schema_0792 | False | 0/135 | 0 | False |
| schema_0793 | True | 188/188 | 0 | True |
| schema_0795 | True | 65/65 | 0 | True |
| schema_0796 | False | 0/79 | 0 | False |
| schema_0798 | False | 0/41 | 0 | False |
| schema_0799 | True | 201/201 | 0 | True |
| schema_0800 | False | 0/46 | 0 | False |
| schema_0802 | False | 0/245 | 0 | False |
| schema_0804 | False | 0/51 | 0 | False |
| schema_0805 | False | 0/62 | 0 | False |
| schema_0807 | False | 0/202 | 0 | False |
| schema_0809 | False | 0/93 | 0 | False |
| schema_0813 | False | 0/56 | 0 | False |
| schema_0814 | False | 0/71 | 0 | False |
| schema_0815 | True | 181/181 | 0 | True |
| schema_0816 | True | 50/50 | 0 | True |
| schema_0817 | False | 0/56 | 0 | False |
| schema_0819 | False | 0/135 | 0 | False |
| schema_0820 | False | 0/1027 | 0 | False |
| schema_0822 | True | 25/25 | 0 | True |
| schema_0823 | False | 0/54 | 0 | False |
| schema_0829 | False | 0/111 | 0 | False |
| schema_0830 | False | 0/245 | 0 | False |
| schema_0831 | False | 0/84 | 0 | False |
| schema_0837 | False | 0/61 | 0 | False |
| schema_0842 | False | 0/21 | 0 | False |
| schema_0843 | False | 0/205 | 0 | False |
| schema_0845 | False | 0/39 | 0 | False |
| schema_0846 | True | 28/28 | 0 | True |
| schema_0847 | False | 0/55 | 0 | False |
| schema_0849 | False | 0/231 | 0 | False |
| schema_0858 | False | 0/56 | 0 | False |
| schema_0859 | False | 0/193 | 0 | False |
| schema_0870 | False | 0/135 | 0 | False |
| schema_0871 | False | 0/514 | 0 | False |
| schema_0874 | False | 0/234 | 0 | False |
| schema_0876 | False | 0/32 | 0 | False |
| schema_0879 | False | 0/208 | 0 | False |
| schema_0881 | False | 0/40 | 0 | False |
| schema_0883 | False | 0/32 | 0 | False |
| schema_0884 | False | 0/83 | 0 | False |
| schema_0889 | False | 0/57 | 0 | False |
| schema_0890 | False | 0/104 | 0 | False |
| schema_0893 | False | 0/76 | 0 | False |
| schema_0899 | False | 0/1375 | 0 | False |
| schema_0900_455237 | True | 181/181 | 0 | True |
| schema_0901_196592 | False | 0/43 | 0 | False |
| schema_0902_537610 | False | 0/505 | 0 | False |
| schema_0903_641274 | False | 0/97 | 0 | False |
| schema_0906_691670 | False | 0/28 | 0 | False |
| schema_0907_160745 | False | 0/234 | 0 | False |
| schema_0908_595029 | False | 0/83 | 0 | False |
| schema_0910_646654 | False | 0/23 | 2 | False |
| schema_0911_351848 | False | 0/62 | 0 | False |
| schema_0912_623966 | False | 0/36 | 0 | False |
| schema_0913_078250 | True | 20/20 | 0 | True |
| schema_0914_546220 | True | 218/218 | 0 | True |
| schema_0917_538663 | False | 0/619 | 0 | False |
| schema_0918_205842 | False | 0/656 | 0 | False |
| schema_0922_290577 | False | 0/231 | 0 | False |
| schema_0923_391323 | False | 0/50 | 0 | False |
| schema_0924_372982 | False | 0/211 | 3 | False |
| schema_0925_652965 | False | 0/855 | 0 | False |
| schema_0926_444961 | False | 0/94 | 0 | False |
| schema_0927_432405 | False | 0/308 | 0 | False |
| schema_0928_520831 | False | 0/106 | 0 | False |
| schema_0929_108090 | False | 0/65 | 0 | False |
| schema_0930_662565 | False | 0/44 | 0 | False |
| schema_0931_468046 | False | 0/97 | 0 | False |
| schema_0932_662552 | False | 0/430 | 0 | False |
| schema_0933_155171 | False | 0/453 | 0 | False |
| schema_0934_326686 | False | 0/83 | 0 | False |
| schema_0936_106723 | True | 52/52 | 0 | True |
| schema_0940_549205 | False | 0/124 | 0 | False |
| schema_0941_659846 | False | 0/39 | 0 | False |
| schema_0942_150757 | False | 0/38 | 0 | False |
| schema_0943_664647 | False | 0/91 | 0 | False |
| schema_0945_570272 | False | 0/55 | 0 | False |
| schema_0948_005703 | True | 118/118 | 0 | True |
| schema_0949_136361 | True | 65/65 | 0 | True |
| schema_0950_614366 | False | 0/167 | 0 | False |
| schema_0952_402169 | False | 0/53 | 0 | False |
| schema_0954_100853 | False | 0/66 | 0 | False |
| schema_0955_026069 | True | 211/211 | 0 | True |
| schema_0956_120022 | True | 320/320 | 0 | True |
| schema_0957_512086 | False | 0/283 | 0 | False |
| schema_0959_117562 | False | 0/25 | 0 | False |
| schema_0960_326291 | False | 0/112 | 0 | False |
| schema_0961_403740 | False | 0/118 | 0 | False |
| schema_0963_525760 | True | 31/31 | 0 | True |
| schema_0964_547031 | False | 0/88 | 0 | False |
| schema_0966_604469 | False | 0/234 | 0 | False |
| schema_0967_047078 | False | 0/2086 | 4 | False |
| schema_0968_637990 | False | 0/284 | 0 | False |
| schema_0969_144544 | True | 138/138 | 0 | True |
| schema_0970_235129 | True | 36/36 | 0 | True |
| schema_0971_260892 | False | 0/209 | 0 | False |
| schema_0972_309020 | False | 0/13 | 25 | False |
| schema_0974_336891 | False | 0/40 | 0 | False |
| schema_0975_324672 | False | 0/27 | 0 | False |
| schema_0976_390037 | False | 0/32 | 0 | False |
| schema_0977_609312 | False | 0/19 | 0 | False |
| schema_0978_482243 | False | 0/135 | 0 | False |
| schema_0980_471690 | True | 30/30 | 0 | True |
| schema_0983_295376 | False | 0/19 | 0 | False |
| schema_0984_334739 | True | 78/78 | 1 | False |
| schema_0985_051832 | True | 52/52 | 0 | True |
| schema_0987_242178 | False | 0/66 | 0 | False |
| schema_0989_143776 | False | 0/38 | 0 | False |
| schema_0990_174588 | False | 0/115 | 0 | False |
| schema_0991_336216 | False | 0/118 | 0 | False |
| schema_0992_027652 | True | 29/29 | 0 | True |
| schema_0993_348884 | False | 0/52 | 0 | False |
| schema_0994_684903 | False | 0/138 | 0 | False |
| schema_0995_401888 | False | 0/208 | 0 | False |
| schema_0996_541548 | False | 0/279 | 0 | False |
| schema_0997_686478 | False | 0/180 | 0 | False |
| schema_0999_062302 | False | 0/76 | 0 | False |
| schema_1000_617352 | False | 0/633 | 0 | False |
| schema_1001_022172 | True | 33/33 | 0 | True |
| schema_1002_179110 | False | 0/120 | 0 | False |
| schema_1003_014791 | True | 15/15 | 0 | True |
| schema_1004_219344 | False | 0/27 | 3 | False |
| schema_1005_570602 | False | 0/81 | 1 | False |
| schema_1007_497366 | True | 15/15 | 0 | True |
| schema_1009_358090 | False | 0/32 | 0 | False |
| schema_1011_386375 | False | 0/28 | 0 | False |
| schema_1012_059331 | False | 0/42 | 0 | False |
| schema_1013_441410 | False | 0/135 | 0 | False |
| schema_1014_183534 | False | 0/1017 | 0 | False |
| schema_1015_545494 | False | 0/28 | 0 | False |
| schema_1019_073065 | True | 45/45 | 0 | True |
| schema_1020_184540 | False | 0/230 | 0 | False |
| schema_1021_493175 | False | 0/51 | 0 | False |
| schema_1022_393548 | False | 0/222 | 0 | False |
| schema_1023_473037 | False | 0/135 | 0 | False |
| schema_1025_400667 | False | 0/34 | 0 | False |
| schema_1027_665032 | False | 0/37 | 2 | False |
| schema_1029_554720 | False | 0/28 | 0 | False |
| schema_1030_245326 | False | 0/166 | 0 | False |
| schema_1031_610804 | False | 0/604 | 0 | False |
| schema_1032_033274 | False | 0/67 | 2 | False |
| schema_1033_362362 | False | 0/33 | 0 | False |
| schema_1034_531024 | False | 0/105 | 0 | False |
| schema_1035_417385 | False | 0/82 | 0 | False |
| schema_1036_289819 | False | 0/90 | 0 | False |
| schema_1037_521203 | False | 0/362 | 0 | False |
| schema_1039_413086 | True | 181/181 | 0 | True |
| schema_1040_447479 | True | 29/29 | 0 | True |
| schema_1041_644261 | False | 0/52 | 0 | False |
| schema_1042_624410 | False | 0/54 | 0 | False |
| schema_1043_118618 | False | 0/50 | 0 | False |
| schema_1044_019860 | False | 0/118 | 0 | False |
| schema_1045_476826 | True | 52/52 | 0 | True |
| schema_1046_287891 | False | 0/135 | 0 | False |
| schema_1047_207965 | False | 0/45 | 0 | False |
| schema_1050_198025 | True | 32/32 | 0 | True |
| schema_1051_259055 | False | 0/55 | 0 | False |
| schema_1053_675929 | False | 0/123 | 0 | False |
| schema_1055_080731 | False | 0/505 | 0 | False |
| schema_1057_542634 | True | 63/63 | 0 | True |
| schema_1058_453330 | True | 61/61 | 0 | True |
| schema_1059_346369 | False | 0/74 | 0 | False |
| schema_1063_000018 | False | 0/447 | 0 | False |
| schema_1064_281329 | True | 47/47 | 0 | True |
| schema_1065_270846 | True | 259/259 | 0 | True |
| schema_1066_508844 | True | 45/45 | 0 | True |
| schema_1068_491851 | False | 0/193 | 0 | False |
| schema_1070_336136 | False | 0/91 | 0 | False |
| schema_1072_659835 | False | 0/342 | 0 | False |
| schema_1073_314345 | False | 0/245 | 0 | False |
| schema_1074_270875 | False | 0/134 | 0 | False |
| schema_1075_084716 | False | 0/135 | 0 | False |
| schema_1076_260105 | True | 16/16 | 0 | True |
| schema_1077_338588 | False | 0/40 | 0 | False |
| schema_1078_600014 | False | 0/245 | 0 | False |
| schema_1079_213377 | False | 0/203 | 0 | False |
| schema_1080_520449 | False | 0/110 | 0 | False |
| schema_1081_289414 | False | 0/83 | 0 | False |
| schema_1082_167670 | False | 0/165 | 0 | False |
| schema_1083_674851 | False | 0/118 | 0 | False |
| schema_1084_417202 | False | 0/45 | 0 | False |
| schema_1085_378499 | True | 63/63 | 0 | True |
| schema_1086_656955 | False | 0/21 | 0 | False |
| schema_1087_556070 | False | 0/119 | 0 | False |
| schema_1088_326764 | False | 0/40 | 0 | False |
| schema_1091_085280 | False | 0/127 | 0 | False |
| schema_1092_364010 | False | 0/543 | 0 | False |
| schema_1096_483661 | False | 0/307 | 0 | False |
| schema_1097_348151 | False | 0/198 | 0 | False |
| schema_1099_654747 | False | 0/33 | 0 | False |
| schema_1100_299606 | False | 0/1149 | 0 | False |
| schema_1101_650753 | True | 152/152 | 4 | False |
| schema_1102_682811 | False | 0/234 | 0 | False |
| schema_1103_115675 | False | 0/37 | 0 | False |
| schema_1105_583941 | False | 0/542 | 0 | False |
| schema_1106_148168 | False | 0/123 | 0 | False |
| schema_1107_641976 | True | 20/20 | 0 | True |
| schema_1108_251945 | False | 0/110 | 1 | False |
| schema_1109_387896 | False | 0/33 | 0 | False |
| schema_1110_493927 | False | 0/34 | 0 | False |
| schema_1111_287457 | False | 0/43 | 0 | False |
| schema_1112_007491 | False | 0/732 | 0 | False |
| schema_1117_622224 | False | 0/136 | 0 | False |
| schema_1118_276995 | False | 0/23 | 0 | False |
| schema_1120_301595 | False | 0/62 | 0 | False |
| schema_1122_217285 | False | 0/1053 | 0 | False |
| schema_1123_278484 | False | 0/24 | 0 | False |
| schema_1125_512036 | False | 0/66 | 0 | False |
| schema_1127_354281 | False | 0/46 | 0 | False |
| schema_1131_139527 | False | 0/132 | 0 | False |
| schema_1132_005273 | False | 0/135 | 0 | False |
| schema_1133_264586 | False | 0/385 | 0 | False |
| schema_1134_654205 | True | 33/33 | 0 | True |
| schema_1136_010581 | True | 21/21 | 0 | True |
| schema_1137_334854 | False | 0/122 | 0 | False |
| schema_1138_419494 | False | 0/101 | 0 | False |
| schema_1139_103727 | False | 0/65 | 0 | False |
| schema_1140_555588 | True | 52/52 | 0 | True |
| schema_1142_235666 | False | 0/140 | 0 | False |
| schema_1145_561835 | False | 0/15 | 0 | False |
| schema_1146_454496 | False | 0/41 | 0 | False |
| schema_1147_662225 | True | 115/115 | 0 | True |
| schema_1148_575663 | False | 0/37 | 0 | False |
| schema_1150_217837 | False | 0/102 | 0 | False |
| schema_1151_048516 | False | 0/956 | 0 | False |
| schema_1154_693691 | False | 0/107 | 0 | False |
| schema_1155_119431 | False | 0/385 | 0 | False |
| schema_1157_113711 | False | 0/72 | 0 | False |
| schema_1158_367517 | False | 0/19 | 0 | False |
| schema_1160_679413 | False | 0/162 | 0 | False |
| schema_1161_297667 | False | 0/56 | 0 | False |
| schema_1162_166427 | False | 0/50 | 0 | False |
| schema_1163_147317 | False | 0/56 | 0 | False |
| schema_1165_522626 | False | 0/86 | 0 | False |
| schema_1166_118993 | False | 0/135 | 0 | False |
| schema_1169_027702 | False | 0/179 | 10 | False |
| schema_1170_055247 | True | 59/59 | 0 | True |
| schema_1172_394848 | False | 0/124 | 0 | False |
| schema_1173_307431 | False | 0/107 | 0 | False |
| schema_1174_475536 | False | 0/207 | 0 | False |
| schema_1176_594644 | False | 0/162 | 0 | False |
| schema_1177_433889 | False | 0/145 | 0 | False |
| schema_1178_485121 | False | 0/72 | 0 | False |
| schema_1179_497840 | False | 0/81 | 0 | False |
| schema_1182_162164 | False | 0/25 | 0 | False |
| schema_1183_499639 | False | 0/35 | 0 | False |
| schema_1184_316974 | False | 0/127 | 0 | False |
| schema_1185_600277 | True | 157/157 | 0 | True |
| schema_1187_124428 | False | 0/33 | 0 | False |
| schema_1189_344012 | False | 0/112 | 0 | False |
| schema_1190_414439 | False | 0/175 | 0 | False |
| schema_1192_006290 | False | 0/33 | 0 | False |
| schema_1193_607463 | False | 0/82 | 0 | False |
| schema_1195_063455 | False | 0/70 | 0 | False |
| schema_1196_356982 | False | 0/226 | 0 | False |
| schema_1197_304772 | False | 0/859 | 0 | False |
| schema_1198_283986 | False | 0/33 | 0 | False |
| schema_1199_239178 | False | 0/129 | 0 | False |
| schema_1201_239756 | False | 0/1297 | 0 | False |
| schema_1202_625711 | False | 0/124 | 0 | False |
| schema_1204_415528 | True | 47/47 | 0 | True |
| schema_1205_030960 | False | 0/204 | 0 | False |
| schema_1207_239489 | False | 0/27 | 0 | False |
| schema_1211_489168 | False | 0/25 | 2 | False |
| schema_1214_130697 | False | 0/32 | 0 | False |
| schema_1215_126567 | True | 69/69 | 0 | True |
| schema_1216_629322 | False | 0/432 | 0 | False |
| schema_1218_654100 | True | 71/71 | 0 | True |
| schema_1219_660727 | False | 0/123 | 0 | False |
| schema_1220_019171 | False | 0/347 | 0 | False |
| schema_1221_233519 | False | 0/28 | 1 | False |
| schema_1222_039356 | False | 0/44 | 0 | False |
| schema_1223_109688 | False | 0/66 | 0 | False |
| schema_1224_512880 | True | 20/20 | 31 | False |
| schema_1226_202671 | False | 0/65 | 0 | False |
| schema_1227_189095 | False | 0/76 | 0 | False |
| schema_1228_038090 | False | 0/64 | 0 | False |
| schema_1229_458061 | False | 0/39 | 0 | False |
| schema_1230_271126 | True | 36/36 | 0 | True |
| schema_1231_368533 | False | 0/167 | 0 | False |
| schema_1232_658129 | False | 0/460 | 0 | False |
| schema_1233_471360 | True | 23/23 | 0 | True |
| schema_1235_589752 | True | 34/34 | 0 | True |
| schema_1237_355236 | False | 0/493 | 0 | False |
| schema_1238_617427 | False | 0/117 | 0 | False |
| schema_1239_638548 | False | 0/52 | 0 | False |
| schema_1240_300469 | False | 0/311 | 0 | False |
| schema_1241_258878 | False | 0/104 | 0 | False |
| schema_1242_249341 | False | 0/118 | 0 | False |
| schema_1243_421581 | False | 0/108 | 0 | False |
| schema_1244_213519 | False | 0/25 | 0 | False |
| schema_1245_589116 | False | 0/43 | 0 | False |
| schema_1246_144281 | True | 65/65 | 0 | True |
| schema_1247_508785 | False | 0/86 | 0 | False |
| schema_1249_289041 | True | 46/46 | 0 | True |
| schema_1251_354516 | False | 0/76 | 0 | False |
| schema_1252_307603 | False | 0/44 | 0 | False |
| schema_1254_666807 | False | 0/80 | 0 | False |
| schema_1256_060874 | False | 0/41 | 0 | False |
| schema_1257_194099 | False | 0/32 | 0 | False |
| schema_1258_595289 | True | 38/38 | 0 | True |
| schema_1259_435992 | False | 0/217 | 0 | False |
| schema_1260_590060 | False | 0/76 | 0 | False |
| schema_1261_504413 | True | 40/40 | 0 | True |
| schema_1262_604319 | False | 0/91 | 0 | False |
| schema_1265_471935 | False | 0/217 | 0 | False |
| schema_1267_558937 | True | 50/50 | 0 | True |
| schema_1268_420590 | False | 0/58 | 0 | False |
| schema_1269_326189 | False | 0/385 | 0 | False |
| schema_1270_099383 | False | 0/57 | 0 | False |
| schema_1271_476007 | True | 85/85 | 0 | True |
| schema_1272_534240 | False | 0/192 | 0 | False |
| schema_1273_587363 | False | 0/17 | 66 | False |
| schema_1274_327667 | True | 45/45 | 0 | True |
| schema_1275_254209 | False | 0/1155 | 2 | False |
| schema_1276_694753 | False | 0/37 | 0 | False |
| schema_1278_640451 | True | 44/44 | 0 | True |
| schema_1279_031575 | False | 0/538 | 0 | False |
| schema_1282_521421 | False | 0/447 | 0 | False |
| schema_1283_332944 | False | 0/68 | 0 | False |
| schema_1285_375298 | False | 0/131 | 0 | False |
| schema_1287_022562 | False | 0/54 | 0 | False |
| schema_1289_203345 | False | 0/83 | 0 | False |
| schema_1290_211978 | False | 0/33 | 0 | False |
| schema_1292_596003 | False | 0/57 | 0 | False |
| schema_1293_031816 | False | 0/83 | 0 | False |
| schema_1295_618406 | False | 0/462 | 0 | False |
| schema_1296_538462 | False | 0/37 | 0 | False |
| schema_1297_191052 | False | 0/143 | 0 | False |
| schema_1298_324181 | False | 0/2349 | 0 | False |
| schema_1299_234701 | False | 0/35 | 0 | False |
| schema_1300_274091 | False | 0/246 | 8 | False |
| schema_1301_448226 | False | 0/61 | 0 | False |
| schema_1302_102857 | True | 22/22 | 0 | True |
| schema_1303_061998 | False | 0/89 | 0 | False |
| schema_1304_492215 | False | 0/129 | 0 | False |
| schema_1305_484289 | False | 0/44 | 0 | False |
| schema_1306_204751 | True | 330/330 | 0 | True |
| schema_1307_441345 | False | 0/38 | 0 | False |
| schema_1308_267996 | False | 0/107 | 31 | False |
| schema_1309_516625 | False | 0/135 | 0 | False |
| schema_1312_441794 | False | 0/34 | 0 | False |
| schema_1313_266228 | False | 0/45 | 0 | False |
| schema_1315_574283 | False | 0/114 | 6 | False |
| schema_1316_174202 | False | 0/124 | 3 | False |
| schema_1317_514500 | False | 0/27 | 0 | False |
| schema_1318_239002 | False | 0/153 | 0 | False |
| schema_1319_042917 | False | 0/35 | 0 | False |

## Blocker details

### schema_0164

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT UNIQUE NOT NULL AUTO_INCREMENT,
                                   ^
```

- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY fk_manager_id'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_1'
- No isolated invalid-parent witness for FK venue.['manager_id'] -> manager: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK venue.['manager_id'] -> manager: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK checkin.['venue_id'] -> venue: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK checkin.['venue_id'] -> venue: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.

### schema_0169

```text
type "nvarchar2" does not exist
LINE 5:     ID_ NVARCHAR2(64),
                ^
```


### schema_0173

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     ID INT NOT NULL AUTO_INCREMENT
                            ^
```


### schema_0177

```text
syntax error at or near "AUTO_INCREMENT"
LINE 4: CREATE TABLE transaction(id INT NOT NULL AUTO_INCREMENT, nam...
                                                 ^
```


### schema_0178

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tbl_admin` (
                     ^
```


### schema_0179

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INTEGER PRIMARY KEY AUTO_INCREMENT,
                                   ^
```


### schema_0181

```text
syntax error at or near "("
LINE 5: Admin_ID INT(11) NOT NULL,
                    ^
```

- Unsupported CHECK expression on 'CUSTOMER': '(Admin_Assisstance_Feedback)>=0 AND (Admin_Assisstance_Feedback)<=5' (unsupported CHECK operator)

### schema_0183

```text
syntax error at or near "user"
LINE 4: CREATE TABLE user(
                     ^
```

- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY article_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_2'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY article_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_2'
- No isolated invalid-parent witness for FK article.['article_author'] -> user: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK article.['article_author'] -> user: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['comments_author'] -> user: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['article_id'] -> article: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['parent_comment'] -> comments: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['parent_comment'] -> comments: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['comments_author'] -> user: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comments.['article_id'] -> article: no target-private columns or independent sibling parent.

### schema_0184

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `me_article` (
                     ^
```


### schema_0185

```text
syntax error at or near "ENGINE"
LINE 37: ) ENGINE = INNODB;
           ^
```

- Unsupported CHECK expression on 'Movie': 'rating = "G" OR rating = "PG" OR rating = "PG-13" OR rating = "R" OR rating = "NC-17"' (unknown column)

### schema_0186

```text
syntax error at or near "("
LINE 27:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_0191

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_0193

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `account` (   `id` bigint(20) NOT NULL AUTO_INC...
                     ^
```


### schema_0195

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `fanmi_address` (
                     ^
```


### schema_0196

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `AuthNode` (
                     ^
```


### schema_0197

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      ^
```


### schema_0198

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `widgets` (
                     ^
```


### schema_0204

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_0207

```text
relation "park_park_id_seq" does not exist
LINE 5:   park_id integer DEFAULT nextval('park_park_id_seq'::regcla...
                                          ^
```


### schema_0208

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `customer` (
                     ^
```


### schema_0210

```text
syntax error at or near "/"
LINE 10: )/
          ^
```

- Conflicting overlapping FK parent fixture for 'UM_ROLE'.
- Conflicting overlapping FK parent fixture for 'UM_ROLE'.

### schema_0217

```text
type "clob" does not exist
LINE 18:  SPECIFICATION CLOB  NULL,
                        ^
```


### schema_0218

```text
type "number" does not exist
LINE 5:  region_id NUMBER PRIMARY KEY,
                   ^
```


### schema_0219

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `collections_tb` (
                     ^
```


### schema_0220

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `faves` (
                     ^
```


### schema_0221

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0223

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `offices` (
                     ^
```


### schema_0225

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bills` (
                     ^
```


### schema_0226

```text
syntax error at or near "ENGINE"
LINE 4: CREATE TABLE SCHEMA_INFO (VERSION VARCHAR(40)) ENGINE=InnoDB...
                                                       ^
```


### schema_0228

```text
type "longvarbinary" does not exist
LINE 16:     BYTES_ longvarbinary,
                    ^
```


### schema_0229

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_0230

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                         ^
```


### schema_0231

```text
type "blob" does not exist
LINE 15:     BYTES_ BLOB,
                    ^
```


### schema_0238

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `collaborator` (
                     ^
```


### schema_0240

```text
type "nvarchar2" does not exist
LINE 5:     NAME_ NVARCHAR2(64),
                  ^
```


### schema_0244

```text
syntax error at or near "comment"
LINE 5: ...name           varchar(120)    not null            comment '...
                                                              ^
```


### schema_0247

```text
relation "students" already exists
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.

### schema_0248

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb;
           ^
```


### schema_0255

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `authorisbn` (
                     ^
```


### schema_0258

```text
syntax error at or near "auto_increment"
LINE 5:     club_id int not null auto_increment,
                                 ^
```


### schema_0264

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   id INT AUTO_INCREMENT PRIMARY KEY,
                 ^
```


### schema_0266

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `failed_jobs` (
                     ^
```


### schema_0267

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `attendees` (
                     ^
```


### schema_0269

```text
there is no unique constraint matching given keys for referenced table "service_reservation"
```

- No isolated invalid-parent witness for FK ROOM_REVIEW.['HotelID', 'RoomNo'] -> ROOM: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK SERVICE_REVIEW.['HotelID', 'Stype'] -> SERVICE: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK BREAKFAST_REVIEW.['HotelID', 'Btype'] -> BREAKFAST: a sibling relationship already guarantees the target parent.

### schema_0272

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `activity` (
                     ^
```


### schema_0273

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin` (
                     ^
```


### schema_0274

```text
type "varchar2" does not exist
LINE 5:   id        varchar2(9)  NOT NULL,
                    ^
```


### schema_0275

```text
syntax error at or near "("
LINE 8: Customer_phone bigint(10),
                             ^
```


### schema_0277

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `contact` (
                     ^
```


### schema_0279

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `abbr` (
                     ^
```

- No isolated invalid-parent witness for FK image_job.['ADS_ID'] -> ads_job: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK image_job.['ADS_ID'] -> ads_job: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['REPORT_ID'] -> report: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['REPORT_ID'] -> report: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['REPORT_ID'] -> report: no target-private columns or independent sibling parent.

### schema_0280

```text
type "clob" does not exist
LINE 18:  SPECIFICATION CLOB  NULL,
                        ^
```


### schema_0281

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `meta` (
                     ^
```


### schema_0282

```text
type "blob" does not exist
LINE 36:     PASSWORD_ BLOB,
                       ^
```


### schema_0284

```text
syntax error at or near "("
LINE 4: CREATE TABLE coin (cid INT(8) PRIMARY KEY,
                                  ^
```


### schema_0285

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
           ^
```


### schema_0286

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0288

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0289

```text
type "blob" does not exist
LINE 24:   COF_DESC blob NOT NULL,
                    ^
```


### schema_0290

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Authorities` (
                     ^
```


### schema_0292

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `area` (
                     ^
```


### schema_0293

```text
there is no unique constraint matching given keys for referenced table "photo"
```


### schema_0294

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            ^
```


### schema_0302

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0311

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `user` (
                     ^
```


### schema_0320

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_0327

```text
schema "cloud" does not exist
LINE 4: CREATE TABLE cloud.users (
                     ^
```


### schema_0328

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `schedule_job` (
                     ^
```


### schema_0329

```text
there is no unique constraint matching given keys for referenced table "company"
```


### schema_0332

```text
there is no unique constraint matching given keys for referenced table "tenants"
```


### schema_0333

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0338

```text
syntax error at or near "IDENTITY"
LINE 5:  id_type INT PRIMARY KEY IDENTITY,
                                 ^
```


### schema_0339

```text
syntax error at or near "("
LINE 6:     customer_ID int(10) not null,
                           ^
```


### schema_0343

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `recruit` (
                     ^
```


### schema_0345

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `customers` (
                     ^
```


### schema_0348

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `application_view` (
                     ^
```


### schema_0349

```text
type "number" does not exist
LINE 6:    ID                   NUMBER(19)           not null,
                                ^
```


### schema_0353

```text
syntax error at or near "CHAR"
LINE 6:    ATTRIBUTE_NAME       VARCHAR2(255 CHAR),
                                             ^
```


### schema_0360

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0366

```text
syntax error at or near "auto_increment"
LINE 5:   id int not null auto_increment,
                          ^
```


### schema_0367

```text
syntax error at or near "autoincrement"
LINE 4: ...ts_path text, files_rights_id integer primary key autoincrem...
                                                             ^
```

- Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Could not determine data type for 'usvn_users_to_groups.users_id'.
- Could not determine data type for 'usvn_users_to_projects.users_id'.

### schema_0368

```text
syntax error at or near "IDENTITY"
LINE 5:   id         INTEGER IDENTITY PRIMARY KEY,
                             ^
```


### schema_0369

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `category` (
                     ^
```


### schema_0371

```text
syntax error at or near "IDENTITY"
LINE 174:     LOG_NR_ numeric(19,0) IDENTITY(1,1),
                                    ^
```


### schema_0372

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `doctors` (
                     ^
```


### schema_0375

```text
syntax error at or near "USER"
LINE 4: create table USER (
                     ^
```

- Could not parse ground-truth column: '#auto_increment=0，但是只能后续设置\n    STATE varchar(4)'
- Could not parse ground-truth column: '#分区id不需要自增，直接初始定义即可，但还是修改为int型\n    ZONE_NAME varchar(10)'
- Could not parse ground-truth column: '# 1000-01-01 00:00:00\n    ZONE_ID int'
- Could not parse ground-truth column: '#1000-01-01 00:00:00\n    primary key (USER_ID, ALBUM_ID, ALBUM_VISIT_TIME)'
- Could not parse ground-truth column: '#1000-01-01 00:00:00\n    ZONE_ID int'
- Could not parse ground-truth column: '##之前没有这个\n    primary key (MESSAGE_ID, USER_ID)'
- Unresolved or ambiguous constraint identifier: 'ZONE_ID'
- Unresolved or ambiguous constraint identifier: 'ZONE_ID'

### schema_0376

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `author` (
                     ^
```


### schema_0377

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_0378

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0384

```text
syntax error at or near "("
LINE 18:  INDEX (socialSecurityNumber),
                ^
```


### schema_0386

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5: id INT NOT NULL AUTO_INCREMENT,
                        ^
```


### schema_0390

```text
syntax error at or near "("
LINE 5:  id INT(11) PRIMARY KEY AUTO_INCREMENT,
               ^
```


### schema_0391

```text
type "varchar2" does not exist
LINE 5:        activist_id           VARCHAR2(20)  PRIMARY KEY,
                                     ^
```


### schema_0392

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `milkshakes`
                     ^
```


### schema_0393

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `gender` (
                     ^
```


### schema_0398

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `TB_USER` (
                     ^
```


### schema_0400

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `akun` (
                     ^
```


### schema_0402

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `login` (
                     ^
```


### schema_0403

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     customerID int AUTO_INCREMENT NOT NULL,
                           ^
```


### schema_0405

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `migrations` (
                     ^
```


### schema_0406

```text
schema "eco" does not exist
LINE 4: CREATE TABLE eco.db (
                     ^
```

- Unsupported CHECK expression on 'soil_component': 'coalesce(frac_vfine, 0) + coalesce(frac_fine, 0) + coalesce(frac_med, 0) +\n           coalesce(frac_coarse, 0) + coalesce(frac_vcoarse, 0) BETWEEN 0 AND 1' (unsupported CHECK token)

### schema_0409

```text
type "eth_tx_attempts_state" does not exist
LINE 68:     state eth_tx_attempts_state NOT NULL,
                   ^
```

- Unsupported CHECK expression on 'eth_receipts': '((octet_length(tx_hash) = 32) AND (octet_length(block_hash) = 32))' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_tx_attempts': "(((state = 'in_progress'::public.eth_tx_attempts_state) AND (broadcast_before_block_num IS NULL)) OR (state = 'broadcast'::public.eth_tx_attempts_state))" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(signed_raw_tx) > 0)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_txes': "(broadcast_at > '2019-01-01 00:00:00+00'::timestamp with time zone)" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_txes': "(((state = 'unstarted'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'in_progress'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'fatal_error'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NOT NULL) AND (broadcast_at IS NULL))) OR ((state = 'unconfirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))) OR ((state = 'confirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))))" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_txes': '(octet_length(from_address) = 20)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_txes': '(octet_length(to_address) = 20)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'heads': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'heads': '(octet_length(parent_hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'keys': '(octet_length(address) = 20)' (unsupported CHECK operator)

### schema_0415

```text
type "datetime" does not exist
LINE 5:         created_at DATETIME,
                           ^
```

- No isolated invalid CHECK witness for instances: 'locked IN (0, 1)'
- No isolated invalid CHECK witness for instances: 'deleted IN (0, 1)'
- No isolated invalid CHECK witness for networks: 'injected IN (0, 1)'
- No isolated invalid CHECK witness for networks: 'deleted IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'reserved IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'allocated IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'leased IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'deleted IN (0, 1)'

### schema_0419

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   ROOM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                         ^
```


### schema_0420

```text
syntax error at or near "("
LINE 6:     TargetPropertyID INT(10) NOT NULL PRIMARY KEY,
                                ^
```


### schema_0425

```text
type "blob" does not exist
LINE 14: job_data blob,
                  ^
```


### schema_0431

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                                          ^
```


### schema_0434

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `calculation_handler` (
                     ^
```


### schema_0436

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin_info` (
                     ^
```


### schema_0438

```text
schema "container" does not exist
LINE 4: CREATE TABLE CONTAINER.ASSIGNMENT (
                     ^
```


### schema_0440

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `comment_comment` (
                     ^
```


### schema_0443

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                         ^
```


### schema_0444

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0449

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bsg_cert` (
                     ^
```


### schema_0454

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_0456

```text
syntax error at or near "("
LINE 36:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_0464

```text
syntax error at or near "("
LINE 6: ...ESCRIPTION VARCHAR(250) NULL,NEXT_FIRE_TIME BIGINT(13) NULL,...
                                                             ^
```


### schema_0465

```text
type "_gender" does not exist
LINE 8:  gtype _GENDER NOT NULL,
               ^
```


### schema_0469

```text
syntax error at or near "auto_increment"
LINE 6:  status_id int auto_increment,
                       ^
```


### schema_0470

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `channel` (
                     ^
```


### schema_0482

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `product` (
                     ^
```


### schema_0490

```text
syntax error at or near "IDENTITY"
LINE 5:   id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
                          ^
```


### schema_0491

```text
there is no unique constraint matching given keys for referenced table "answer"
```

- No isolated invalid-parent witness for FK answer.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK answer.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comment.['answer_id'] -> answer: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comment.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comment.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK comment.['answer_id'] -> answer: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK question_tag.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK question_tag.['tag_id'] -> tag: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK question_tag.['question_id'] -> question: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK question_tag.['tag_id'] -> tag: no target-private columns or independent sibling parent.

### schema_0493

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `aliquot` (
                     ^
```


### schema_0494

```text
syntax error at or near "user"
LINE 4: create table user(
                     ^
```


### schema_0496

```text
type "number" does not exist
LINE 5:   id              NUMBER(7)     NOT NULL PRIMARY KEY,
                          ^
```


### schema_0497

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   id INT NOT NULL AUTO_INCREMENT,
                          ^
```


### schema_0503

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `actor` (
                     ^
```


### schema_0505

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT NOT NULL AUTO_INCREMENT,
                            ^
```


### schema_0506

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0507

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `t_category_master` (
                     ^
```


### schema_0511

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `company` (
                     ^
```


### schema_0512

```text
there is no unique constraint matching given keys for referenced table "archival_institution"
```


### schema_0513

```text
type "varchar2" does not exist
LINE 7:  ATTACHFILE_SEQ varchar2(40) NOT NULL,
                        ^
```


### schema_0517

```text
type "status_type" does not exist
LINE 8: ...id SERIAL PRIMARY KEY, project_id INTEGER, status status_typ...
                                                             ^
```


### schema_0518

```text
type "longvarbinary" does not exist
LINE 16:     BYTES_ longvarbinary,
                    ^
```


### schema_0521

- Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).

### schema_0522

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `companies` (
                     ^
```


### schema_0527

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `eavs` (
                     ^
```


### schema_0530

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `chi_tiet_don_hangs` (
                     ^
```


### schema_0532

```text
syntax error at or near ")"
LINE 41: );
         ^
```


### schema_0533

```text
syntax error at or near "("
LINE 4: create table Department(dept_id int(255),dept_name varchar(5...
                                           ^
```


### schema_0535

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `categories` (
                     ^
```


### schema_0536

```text
syntax error at or near ")"
LINE 40: );
         ^
```


### schema_0544

```text
type "varbinary" does not exist
LINE 14:     PERMISSIONS VARBINARY,
                         ^
```


### schema_0549

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bed` (
                     ^
```


### schema_0551

```text
syntax error at or near "user"
LINE 4: create table user
                     ^
```


### schema_0552

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `computer_user` (
                     ^
```


### schema_0555

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `xxl_job_qrtz_calendars` (
                     ^
```


### schema_0556

```text
syntax error at or near "auto_increment"
LINE 8: create table countries2(country_id int UNIQUE auto_increment...
                                                      ^
```


### schema_0560

```text
column "shostid1" referenced in foreign key constraint does not exist
```

- Unresolved or ambiguous constraint identifier: 'shostid1'
- Unresolved or ambiguous constraint identifier: 'shostid2'

### schema_0566

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `coreRequests` (
                     ^
```


### schema_0567

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```


### schema_0570

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `accounts` (
                     ^
```


### schema_0571

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `account_creation_token` (
                     ^
```

- No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.

### schema_0573

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb;
           ^
```


### schema_0575

```text
type "number" does not exist
LINE 7:  BUY_SEQ number NOT NULL,
                 ^
```


### schema_0577

```text
syntax error at or near "auto_increment"
LINE 4: create table routes (routeid int primary key auto_increment,...
                                                     ^
```


### schema_0578

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_0580

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `identities` (
                     ^
```


### schema_0585

```text
syntax error at or near "USER"
LINE 4: create table USER (
                     ^
```


### schema_0592

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:   id INTEGER PRIMARY KEY AUTOINCREMENT,
                                 ^
```


### schema_0593

```text
syntax error at or near "User"
LINE 4: CREATE TABLE User (
                     ^
```


### schema_0597

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_assignment` (
                     ^
```


### schema_0603

```text
syntax error at or near "*"
LINE 147:     DOUBLE_ NUMBER(*,10),
                             ^
```


### schema_0604

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `blocks` (
                     ^
```


### schema_0611

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `chat` (
                     ^
```


### schema_0612

```text
relation "dept_emp" does not exist
```

- No isolated invalid-parent witness for FK salaries.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK titles.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.

### schema_0614

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `client_account` (
                     ^
```


### schema_0621

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   id INTEGER AUTO_INCREMENT PRIMARY KEY,
                     ^
```


### schema_0624

```text
type "datetime" does not exist
LINE 18: DATE_MADE DATETIME  NULL DEFAULT NULL,
                   ^
```


### schema_0625

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `categories` (
                     ^
```


### schema_0628

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `client` (
                     ^
```


### schema_0631

```text
type "number" does not exist
LINE 5:  id_matricula number(5),
                      ^
```


### schema_0633

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb;
           ^
```


### schema_0639

```text
syntax error at or near "auto_increment"
LINE 5:  staff_id int auto_increment primary key,
                      ^
```


### schema_0642

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `dt_schedule`  (
                     ^
```


### schema_0648

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin` (
                     ^
```


### schema_0651

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tb_brandclothesinfo` (
                     ^
```


### schema_0652

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_group` (
                     ^
```


### schema_0654

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `customers` (
                     ^
```


### schema_0655

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `articles` (
                     ^
```


### schema_0659

```text
syntax error at or near "engine"
LINE 4: ...null, primary key (application_user_id, role_id)) engine=Inn...
                                                             ^
```


### schema_0660

```text
type "d_boolean" does not exist
LINE 37:   approved D_BOOLEAN DEFAULT 1,
                    ^
```


### schema_0672

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `blog` (
                     ^
```


### schema_0673

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `calendar` (
                     ^
```


### schema_0674

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:  id INT PRIMARY KEY AUTO_INCREMENT,
                            ^
```


### schema_0676

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `history` (
                     ^
```


### schema_0684

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Users` (
                     ^
```


### schema_0685

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:         id INTEGER PRIMARY KEY AUTO_INCREMENT
                                       ^
```


### schema_0686

```text
syntax error at or near "IDENTITY"
LINE 172:     LOG_NR_ numeric(19,0) IDENTITY(1,1),
                                    ^
```


### schema_0687

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0688

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   ROOM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                         ^
```


### schema_0694

```text
schema "taxonomy" does not exist
LINE 4: CREATE TABLE taxonomy.high_level
                     ^
```


### schema_0696

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:     id BIGINT AUTO_INCREMENT NOT NULL,
                      ^
```

- Unresolved or ambiguous constraint identifier: 'pickup_ship_id'

### schema_0699

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `app_user` (
                     ^
```


### schema_0701

```text
syntax error at or near "user"
LINE 4: create table user (
                     ^
```


### schema_0706

```text
syntax error at or near "IDENTITY"
LINE 5:   id         INTEGER IDENTITY PRIMARY KEY,
                             ^
```


### schema_0724

```text
type "blob" does not exist
LINE 36:     PASSWORD_ BLOB,
                       ^
```


### schema_0725

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `users` (
                     ^
```


### schema_0727

```text
schema "cocoapp" does not exist
LINE 4: CREATE TABLE cocoapp.users
                     ^
```


### schema_0731

```text
relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
```


### schema_0732

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `oauth_clients` (
                     ^
```


### schema_0734

```text
syntax error at or near "UNSIGNED"
LINE 5:   id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
                    ^
```


### schema_0737

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin`
                     ^
```


### schema_0738

```text
type "number" does not exist
LINE 5:     id              NUMBER(10) NOT NULL,
                            ^
```


### schema_0740

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_0742

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `accept_deliveries` (
                     ^
```

- Unsupported CHECK expression on 'transactions': 'json_valid(`meta`)' (unsupported CHECK operator)

### schema_0745

```text
there is no unique constraint matching given keys for referenced table "pwm_device"
```


### schema_0751

```text
type "number" does not exist
LINE 6:   ID              NUMBER(10, 0) NOT NULL,
                          ^
```


### schema_0755

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `member` (
                     ^
```


### schema_0756

```text
type "nvarchar" does not exist
LINE 6:     SCHED_NAME NVARCHAR(120) NOT NULL,
                       ^
```


### schema_0761

```text
there is no unique constraint matching given keys for referenced table "device"
```


### schema_0762

```text
syntax error at or near "*"
LINE 226:     DOUBLE_ NUMBER(*,10),
                             ^
```


### schema_0764

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `categories` (
                     ^
```


### schema_0772

```text
syntax error at or near "ENGINE"
LINE 11: )ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Could not parse ground-truth column: '##为空则没有到，\n\tckst_reason varchar(200) null'

### schema_0775

```text
syntax error at or near "IDENTITY"
LINE 5:   jobinstanceid    BIGINT NOT NULL PRIMARY KEY IDENTITY,
                                                       ^
```


### schema_0777

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0781

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `charts` (
                     ^
```


### schema_0782

```text
syntax error at or near "autoincrement"
LINE 5:   id integer primary key autoincrement,
                                 ^
```


### schema_0784

```text
type "number" does not exist
LINE 5:   id              NUMBER(7)     NOT NULL PRIMARY KEY,
                          ^
```


### schema_0786

```text
syntax error at or near "unsigned"
LINE 5:    region_id int unsigned not null primary key, 
                         ^
```


### schema_0788

```text
syntax error at or near "("
LINE 5:   id                            int(10) UNSIGNED AUTO_INCREM...
                                           ^
```


### schema_0790

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `country` (
                     ^
```


### schema_0792

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0796

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `city` (
                     ^
```


### schema_0798

```text
syntax error at or near "user"
LINE 4: create table user
                     ^
```


### schema_0800

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 14:         LAST_MODIFIED_TIME TIMESTAMP DEFAULT '0000-00-00 00:...
                                                      ^
```


### schema_0802

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `sys_menu` (
                     ^
```


### schema_0804

```text
schema "clin_prescribing" does not exist
LINE 4: CREATE TABLE clin_prescribing.medications
                     ^
```


### schema_0805

```text
relation "park_park_id_seq" does not exist
LINE 5:   park_id integer DEFAULT nextval('park_park_id_seq'::regcla...
                                          ^
```


### schema_0807

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `band` (
                     ^
```


### schema_0809

```text
type "nvarchar2" does not exist
LINE 5:  ID_ NVARCHAR2(255) NOT NULL,
             ^
```


### schema_0813

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `a_book` (
                     ^
```


### schema_0814

```text
syntax error at or near "("
LINE 14:     status        INT(1) DEFAULT 1,
                              ^
```


### schema_0817

```text
there is no unique constraint matching given keys for referenced table "roles"
```


### schema_0819

```text
syntax error at or near "ENGINE"
LINE 16: ENGINE=InnoDB;
         ^
```


### schema_0820

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `address` (
                     ^
```


### schema_0823

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0829

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `break` (
                     ^
```


### schema_0830

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `sys_menu` (
                     ^
```


### schema_0831

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   group_code INT NOT NULL AUTO_INCREMENT,
                                  ^
```


### schema_0837

```text
syntax error at or near "identity"
LINE 4: create table T_ACCOUNT (ID integer identity primary key, NUM...
                                           ^
```


### schema_0842

```text
type "varchar_ignorecase" does not exist
LINE 6:     group_name varchar_ignorecase(50) not null
                       ^
```


### schema_0843

```text
type "d_boolean" does not exist
LINE 37:   approved D_BOOLEAN DEFAULT 1,
                    ^
```


### schema_0845

```text
relation "logging_event_id_seq" does not exist
LINE 18:     event_id          INT DEFAULT nextval('logging_event_id_...
                                                   ^
```


### schema_0847

```text
syntax error at or near "`"
LINE 4: create table `tb_college`
                     ^
```


### schema_0849

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `audit` (
                     ^
```


### schema_0858

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `category` (
                     ^
```


### schema_0859

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_group` (
                     ^
```


### schema_0870

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb default charset=utf8;
           ^
```


### schema_0871

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `AttributeCategories` (
                     ^
```


### schema_0874

```text
syntax error at or near "*"
LINE 151:     DOUBLE_ NUMBER(*,10),
                             ^
```


### schema_0876

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   ROOM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                         ^
```


### schema_0879

```text
type "clob" does not exist
LINE 77:     contents CLOB not null,
                      ^
```


### schema_0881

```text
relation "seq_employee_id" does not exist
LINE 5:  employee_id integer NOT NULL DEFAULT nextval('seq_employee_...
                                                      ^
```


### schema_0883

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `recipes` (
                     ^
```


### schema_0884

```text
type "clob" does not exist
LINE 19:   description  clob,
                        ^
```


### schema_0889

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `foods` (
                     ^
```


### schema_0890

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bills` (
                     ^
```


### schema_0893

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0899

```text
type "blob" does not exist
LINE 667:     raw_data blob NOT NULL,
                       ^
```


### schema_0901_196592

```text
syntax error at or near "identity"
LINE 9:   ID int identity, 
                 ^
```


### schema_0902_537610

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_0903_641274

```text
syntax error at or near "TYPE"
LINE 35: ) TYPE=INNODB;
           ^
```


### schema_0906_691670

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                             ^
```


### schema_0907_160745

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_group` (
                     ^
```


### schema_0908_595029

```text
syntax error at or near "char"
LINE 7:  JOB_NAME VARCHAR2(100 char) NOT NULL,
                               ^
```


### schema_0910_646654

```text
syntax error at or near "auto_increment"
LINE 4: create table roles (id bigint not null auto_increment, creat...
                                               ^
```

- No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.

### schema_0911_351848

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `access` (
                     ^
```


### schema_0912_623966

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     ID INT NOT NULL AUTO_INCREMENT
                            ^
```


### schema_0917_538663

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `wp_actionscheduler_actions` (
                     ^
```


### schema_0918_205842

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin_user` (
                     ^
```


### schema_0922_290577

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tbl_actions_log` (
                     ^
```


### schema_0923_391323

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0924_372982

```text
syntax error at or near ";"
LINE 25: CREATE TABLE sqlite_stat1(tbl,idx,stat);
                                                ^
```

- Could not determine data type for 'sqlite_stat1.tbl'.
- Could not determine data type for 'sqlite_stat1.idx'.
- Could not determine data type for 'sqlite_stat1.stat'.

### schema_0925_652965

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `alarm_set` (
                     ^
```


### schema_0926_444961

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `contains` (
                     ^
```


### schema_0927_432405

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `answer` (
                     ^
```


### schema_0928_520831

```text
syntax error at or near "user"
LINE 4: CREATE TABLE user(
                     ^
```


### schema_0929_108090

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `findbugs_bugreport` (
                     ^
```


### schema_0930_662565

```text
type "varhcar" does not exist
LINE 9:     name VARHCAR(100) NOT NULL
                 ^
```


### schema_0931_468046

```text
syntax error at or near "user"
LINE 4: create table user(
                     ^
```


### schema_0932_662552

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `t_escheduler_alert` (
                     ^
```


### schema_0933_155171

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `notify_notification` (
                     ^
```


### schema_0934_326686

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `booking` (
                     ^
```


### schema_0940_549205

```text
syntax error at or near "IDENTITY"
LINE 5:  id_stc INTEGER PRIMARY KEY IDENTITY(1, 1),
                                    ^
```


### schema_0941_659846

```text
relation "library_cards" does not exist
```


### schema_0942_150757

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `area` (
                     ^
```


### schema_0943_664647

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `employees` (
                     ^
```


### schema_0945_570272

```text
type "varchar_ignorecase" does not exist
LINE 7:   sid varchar_ignorecase(100) not null,
              ^
```


### schema_0950_614366

```text
syntax error at or near "`"
LINE 4: create table `position` (
                     ^
```


### schema_0952_402169

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `pilot` (
                     ^
```


### schema_0954_100853

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `users` (
                     ^
```


### schema_0957_512086

```text
syntax error at or near "("
LINE 61:     age INTEGER(3) NOT NULL,
                        ^
```


### schema_0959_117562

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:    AuthorID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                 ^
```


### schema_0960_326291

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `brands` (
                     ^
```


### schema_0961_403740

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:     ID                  INTEGER PRIMARY KEY AUTOINCREMENT,
                                                    ^
```


### schema_0964_547031

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_0966_604469

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `adjustsalary`
                     ^
```


### schema_0967_047078

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `assessment_aiclassifier` (
                     ^
```

- Conflicting overlapping FK parent fixture for 'wiki_article'.
- Conflicting overlapping FK parent fixture for 'wiki_attachment'.
- Conflicting overlapping FK parent fixture for 'wiki_revisionplugin'.
- Conflicting overlapping FK parent fixture for 'wiki_urlpath'.

### schema_0968_637990

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `assign_reasons` (
                     ^
```


### schema_0971_260892

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ad` (
                     ^
```


### schema_0972_309020

```text
relation "apm_package_types" does not exist
```

- Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Unresolved or ambiguous constraint identifier: 'ad_locales'
- Could not synthesize a base row for the PK test on 'lang_message_keys'.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Could not synthesize a parent row in 'apm_package_types' for the FK-accept test on 'lang_message_keys'.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Could not synthesize a base row for the PK test on 'lang_messages'.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; no fixture was generated.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- table 'lang_messages': could not synthesize a required parent row in 'lang_message_keys' for NOT NULL foreign key ['message_key', 'package_key']; no fixture was generated.
- Could not synthesize a parent row in 'ad_locales' for the FK-accept test on 'lang_messages'.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; no fixture was generated.
- Could not synthesize a parent row in 'lang_message_keys' for the FK-accept test on 'lang_messages'.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Could not synthesize a parent row in 'lang_message_keys' for the cascade_behavior test on 'lang_messages'.

### schema_0974_336891

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `meal` (
                     ^
```


### schema_0975_324672

```text
there is no unique constraint matching given keys for referenced table "artist"
```


### schema_0976_390037

```text
there is no unique constraint matching given keys for referenced table "log"
```


### schema_0977_609312

```text
syntax error at or near "auto_increment"
LINE 5:   product_id int auto_increment,
                         ^
```


### schema_0978_482243

```text
syntax error at or near "("
LINE 27:   NEXT_FIRE_TIME BIGINT(13)   NULL,
                                ^
```


### schema_0983_295376

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tv_genres` (
                     ^
```


### schema_0984_334739

- No isolated invalid-parent witness for FK plot_checks.['lab_id'] -> labs: a sibling relationship already guarantees the target parent.

### schema_0987_242178

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `users` (
                     ^
```


### schema_0989_143776

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:    id BIGINT NOT NULL AUTO_INCREMENT,
                              ^
```


### schema_0990_174588

```text
syntax error at or near "auto_increment"
LINE 61:     transfer_id BIGINT NOT NULL auto_increment,
                                         ^
```


### schema_0991_336216

```text
relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
```


### schema_0993_348884

```text
syntax error at or near "IDENTITY"
LINE 5:   id         INTEGER IDENTITY PRIMARY KEY,
                             ^
```


### schema_0994_684903

```text
syntax error at or near "IDENTITY"
LINE 28:   id INT PRIMARY KEY IDENTITY NOT NULL,
                              ^
```


### schema_0995_401888

```text
type "d_boolean" does not exist
LINE 37:   approved D_BOOLEAN DEFAULT 1,
                    ^
```


### schema_0996_541548

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `choice` (
                     ^
```


### schema_0997_686478

```text
syntax error at or near "auto_increment"
LINE 6:  SUPPLIER_ID int not null auto_increment,
                                  ^
```


### schema_0999_062302

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_1000_617352

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `alert` (
                     ^
```


### schema_1002_179110

```text
syntax error at or near "("
LINE 4: CREATE TABLE table1 (att_int INT(8) PRIMARY KEY,
                                        ^
```


### schema_1004_219344

```text
syntax error at or near "ALTER"
LINE 31: ALTER TABLE roles_users ADD CONSTRAINT roles_fk FOREIGN KEY ...
         ^
```

- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.

### schema_1005_570602

```text
syntax error at or near "("
LINE 80: ALTER TABLE departments ADD ( CONSTRAINT dept_mgr_fk FOREIGN...
                                     ^
```

- Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'

### schema_1009_358090

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   ROOM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                         ^
```


### schema_1011_386375

```text
type "clob" does not exist
LINE 16:     stacktrace CLOB NOT NULL,
                        ^
```


### schema_1012_059331

```text
syntax error at or near ","
LINE 10:   PREVAILING_WAGE FLOAT(10,2) NOT NULL,
                                   ^
```


### schema_1013_441410

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb default charset=utf8;
           ^
```


### schema_1014_183534

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `alert` (
                     ^
```


### schema_1015_545494

```text
syntax error at or near "("
LINE 5:  PlayerID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     ^
```


### schema_1020_184540

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `campaign` (
                     ^
```


### schema_1021_493175

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id int AUTO_INCREMENT primary key,
                   ^
```


### schema_1022_393548

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `accounts` (
                     ^
```


### schema_1023_473037

```text
syntax error at or near "ENGINE"
LINE 16: ENGINE=InnoDB;
         ^
```


### schema_1025_400667

```text
syntax error at or near "AUTOINCREMENT"
LINE 5: GatewaySeqNo  INTEGER PRIMARY KEY AUTOINCREMENT,
                                          ^
```


### schema_1027_665032

```text
constraint "fixture_id_fk" for relation "motion_packets" already exists
```

- No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.

### schema_1029_554720

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INTEGER NOT NULL AUTO_INCREMENT,
                                ^
```


### schema_1030_245326

```text
syntax error at or near "UNSIGNED"
LINE 6:   roleId INT UNSIGNED NOT NULL,
                     ^
```


### schema_1031_610804

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `applications` (
                     ^
```


### schema_1032_033274

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `categories` (
                     ^
```

- Unresolved or ambiguous constraint identifier: 'products_id'
- Unresolved or ambiguous constraint identifier: 'orders_id'

### schema_1033_362362

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:        ID INT NOT NULL AUTO_INCREMENT
                               ^
```


### schema_1034_531024

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin` (
                     ^
```


### schema_1035_417385

```text
type "badge" does not exist
LINE 28:     badge badge DEFAULT 'none'::badge,
                   ^
```


### schema_1036_289819

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   codDipartimento int NOT NULL AUTO_INCREMENT,
                                       ^
```


### schema_1037_521203

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `access_tokens` (
                     ^
```


### schema_1041_644261

```text
syntax error at or near "IDENTITY"
LINE 5:   id         INTEGER IDENTITY PRIMARY KEY,
                             ^
```


### schema_1042_624410

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_1043_118618

```text
type "number" does not exist
LINE 5:   u_id number(9) NOT NULL,
               ^
```


### schema_1044_019860

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `br_category` (
                     ^
```


### schema_1046_287891

```text
syntax error at or near "ENGINE"
LINE 17:   ENGINE = InnoDB;
           ^
```


### schema_1047_207965

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `rules` (
                     ^
```


### schema_1051_259055

```text
syntax error at or near "IDENTITY"
LINE 5:   jobinstanceid   BIGINT NOT NULL PRIMARY KEY IDENTITY,
                                                      ^
```


### schema_1053_675929

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `customer` (
                     ^
```


### schema_1055_080731

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_1059_346369

```text
syntax error at or near "same"
LINE 4: CREATE TABLE statements same as in Figure 5.1b  */
                                ^
```


### schema_1063_000018

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1068_491851

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `address`  (
                     ^
```


### schema_1070_336136

```text
syntax error at or near "auto_increment"
LINE 5:     id int not null auto_increment primary key,
                            ^
```


### schema_1072_659835

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `department` (
                     ^
```


### schema_1073_314345

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `sys_menu` (
                     ^
```


### schema_1074_270875

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `appointments` (
                     ^
```


### schema_1075_084716

```text
syntax error at or near "engine"
LINE 16: ) engine=innodb;
           ^
```


### schema_1077_338588

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:     id INTEGER PRIMARY KEY AUTOINCREMENT,
                                   ^
```


### schema_1078_600014

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `sys_menu` (
                     ^
```


### schema_1079_213377

```text
type "blob" does not exist
LINE 16:     BYTES_ BLOB,
                    ^
```


### schema_1080_520449

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `app` (
                     ^
```


### schema_1081_289414

```text
syntax error at or near "`"
LINE 4: create table `users` (
                     ^
```


### schema_1082_167670

```text
type "longtext" does not exist
LINE 13:     abstract LONGTEXT,
                      ^
```


### schema_1083_674851

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `items` (
                     ^
```


### schema_1084_417202

```text
type "number" does not exist
LINE 5:   id              NUMBER(7)     NOT NULL PRIMARY KEY,
                          ^
```


### schema_1086_656955

```text
type "varchar2" does not exist
LINE 6:  movie_name varchar2(50));
                    ^
```


### schema_1087_556070

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bucket` (
                     ^
```


### schema_1088_326764

```text
syntax error at or near "UNSIGNED"
LINE 5:   id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                 ^
```


### schema_1091_085280

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `melete_cc_license` (
                     ^
```


### schema_1092_364010

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```


### schema_1096_483661

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_group`  (
                     ^
```


### schema_1097_348151

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `accounts` (
                     ^
```


### schema_1099_654747

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bsg_cert` (
                     ^
```


### schema_1100_299606

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_group` (
                     ^
```


### schema_1101_650753

- No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.

### schema_1102_682811

```text
syntax error at or near "*"
LINE 151:     DOUBLE_ NUMBER(*,10),
                             ^
```


### schema_1103_115675

```text
syntax error at or near "auto_increment"
LINE 4: create table hotel (id int primary key auto_increment, addre...
                                               ^
```


### schema_1105_583941

```text
syntax error at or near "("
LINE 464:   PRIMARY KEY (ID)
                        ^
```


### schema_1106_148168

```text
syntax error at or near "("
LINE 36:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1108_251945

```text
syntax error at or near "("
LINE 8:   ccontact int(11),
                      ^
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.

### schema_1109_387896

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `messages` (
                     ^
```


### schema_1110_493927

```text
syntax error at or near "auto_increment"
LINE 6:     id               bigint auto_increment
                                    ^
```


### schema_1111_287457

```text
there is no unique constraint matching given keys for referenced table "languages"
```


### schema_1112_007491

```text
syntax error at or near "`"
LINE 148:  `value` VARCHAR(64) NULL,
           ^
```


### schema_1117_622224

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `qrtz_blob_triggers` (
                     ^
```


### schema_1118_276995

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `email` (
                     ^
```


### schema_1120_301595

```text
syntax error at or near "AUTOINCREMENT"
LINE 6:  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                                         ^
```


### schema_1122_217285

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `light_address_book` (
                     ^
```


### schema_1123_278484

```text
type "varchar2" does not exist
LINE 5:  account_name varchar2(254) not null,
                      ^
```


### schema_1125_512036

```text
syntax error at or near "("
LINE 18:  PRIMARY KEY (emp_no)
                      ^
```


### schema_1127_354281

```text
relation "global_seq" does not exist
LINE 6:   id          INTEGER PRIMARY KEY DEFAULT nextval('global_se...
                                                          ^
```


### schema_1131_139527

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `__efmigrationshistory` (
                     ^
```


### schema_1132_005273

```text
syntax error at or near "("
LINE 27:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1133_264586

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ActionStrings` (
                     ^
```


### schema_1137_334854

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `gmm_attachments` (
                     ^
```


### schema_1138_419494

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   id INT AUTO_INCREMENT PRIMARY KEY,
                 ^
```


### schema_1139_103727

```text
syntax error at or near "("
LINE 6:     CustomerID INT(11) NOT NULL AUTO_INCREMENT,
                          ^
```


### schema_1142_235666

```text
type "nvarchar" does not exist
LINE 6:     SCHED_NAME NVARCHAR(120) NOT NULL,
                       ^
```


### schema_1145_561835

```text
type "test29_master_depend" does not exist
LINE 11:     index test29_master_depend ( depend1_id ),
                   ^
```


### schema_1146_454496

```text
syntax error at or near "auto_increment"
LINE 5: idcategoria int not null primary key auto_increment,
                                             ^
```


### schema_1148_575663

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `person` (
                     ^
```


### schema_1150_217837

```text
syntax error at or near "AUTO_INCREMENT"
LINE 12: ...erms_id              INT            PRIMARY KEY   AUTO_INCRE...
                                                              ^
```


### schema_1151_048516

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ACT_GE_BYTEARRAY` (
                     ^
```


### schema_1154_693691

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `address` (
                     ^
```


### schema_1155_119431

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ActionStrings` (
                     ^
```


### schema_1157_113711

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `payment` (
                     ^
```


### schema_1158_367517

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tv_genres` (
                     ^
```


### schema_1160_679413

```text
syntax error at or near "CHAR"
LINE 5: ...                                        VARCHAR2(38 CHAR),  
                                                               ^
```


### schema_1161_297667

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:     id              INT         NOT NULL AUTO_INCREMENT,
                                                 ^
```


### schema_1162_166427

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   CarID TINYINT(2) NOT NULL AUTO_INCREMENT, 
                                    ^
```


### schema_1163_147317

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `mg_role` (
                     ^
```


### schema_1165_522626

```text
syntax error at or near "IDENTITY"
LINE 5:  JOB_INSTANCE_ID BIGINT IDENTITY NOT NULL PRIMARY KEY ,  
                                ^
```


### schema_1166_118993

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `administrator` (
                     ^
```


### schema_1169_027702

```text
syntax error at or near "auto_increment"
LINE 20: create table Users(empid int unique auto_increment,name varc...
                                             ^
```

- Could not parse a CREATE TABLE definition.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Unsupported ALTER TABLE constraint: 'drop foreign key products_ibfk_1'
- Unresolved or ambiguous constraint identifier: 'studentid'
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.

### schema_1172_394848

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `categories` (
                     ^
```


### schema_1173_307431

```text
type "number" does not exist
LINE 6: roleID NUMBER(6) NOT NULL ,
               ^
```


### schema_1174_475536

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `mrbs_area` (
                     ^
```


### schema_1176_594644

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `invite` (
                     ^
```


### schema_1177_433889

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `address` (
                     ^
```


### schema_1178_485121

```text
syntax error at or near "User"
LINE 39: create table User(
                      ^
```


### schema_1179_497840

```text
type "blob" does not exist
LINE 19:   image        blob,
                        ^
```


### schema_1182_162164

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `individu` (
                     ^
```


### schema_1183_499639

```text
syntax error at or near "auto_increment"
LINE 5:  bno int not null auto_increment,
                          ^
```


### schema_1184_316974

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `customers` (
                     ^
```


### schema_1187_124428

```text
syntax error at or near "AUTO_INCREMENT"
LINE 6:  id INT NOT NULL AUTO_INCREMENT
                         ^
```


### schema_1189_344012

```text
there is no unique constraint matching given keys for referenced table "users"
```


### schema_1190_414439

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```


### schema_1192_006290

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `actions` (
                     ^
```


### schema_1193_607463

```text
syntax error at or near "("
LINE 6:     userID INT(5) PRIMARY KEY NOT NULL
                      ^
```


### schema_1195_063455

```text
type "nvarchar" does not exist
LINE 5:     NAME_ nvarchar(64),
                  ^
```


### schema_1196_356982

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `emergency_categories` (
                     ^
```


### schema_1197_304772

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `addresses` (
                     ^
```


### schema_1198_283986

```text
type "datetime" does not exist
LINE 13: order_date datetime,
                    ^
```


### schema_1199_239178

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `auth_activation_attempts` (
                     ^
```


### schema_1201_239756

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_1202_625711

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `book_author`  (
                     ^
```


### schema_1205_030960

```text
syntax error at or near "IDENTITY"
LINE 5:   id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
                          ^
```


### schema_1207_239489

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `guard` (
                     ^
```


### schema_1211_489168

```text
syntax error at or near "ENGINE"
LINE 5: ENGINE = $engine_type;
        ^
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Conflicting overlapping FK parent fixture for 't1'.

### schema_1214_130697

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   ROOM_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                         ^
```


### schema_1216_629322

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1219_660727

```text
type "blob" does not exist
LINE 13: job_data blob,
                  ^
```


### schema_1220_019171

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_1221_233519

```text
type "datetime" does not exist
LINE 7:     NgaySinh DATETIME,
                     ^
```

- Unresolved or ambiguous constraint identifier: 'MaGV'

### schema_1222_039356

```text
syntax error at or near "user"
LINE 34:                           user varchar(255) not null,
                                   ^
```


### schema_1223_109688

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `companies` (
                     ^
```


### schema_1224_512880

- Could not synthesize a base row for the PK test on 'Employees'.
- No bounded CHECK-compatible fixture found for 'Employees'.
- No bounded CHECK-compatible fixture found for 'Employees'.
- No isolated valid CHECK witness for Employees: 'hoursPweek <=168'
- No bounded CHECK-compatible fixture found for 'Employees'.
- No isolated invalid CHECK witness for Employees: 'hoursPweek <=168'
- No isolated valid CHECK witness for Employees: 'hoursPweek > 0'
- No isolated invalid CHECK witness for Employees: 'hoursPweek > 0'
- No isolated valid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- No isolated invalid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Could not synthesize a base row for the PK test on 'Departments'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- No isolated valid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- No bounded CHECK-compatible fixture found for 'Departments'.
- No isolated invalid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- No bounded CHECK-compatible fixture found for 'Departments'.
- Could not synthesize a parent row in 'Departments' for the FK-accept test on 'DeptMissions'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- No bounded CHECK-compatible fixture found for 'Departments'.
- Could not synthesize a parent row in 'Departments' for the FK-accept test on 'WorksFor'.
- No bounded CHECK-compatible fixture found for 'Departments'.
- No isolated valid CHECK witness for WorksFor: 'percentage > 0'
- No bounded CHECK-compatible fixture found for 'Departments'.
- table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- No isolated invalid CHECK witness for WorksFor: 'percentage > 0'
- No isolated valid CHECK witness for WorksFor: 'percentage <= 100'
- No isolated invalid CHECK witness for WorksFor: 'percentage <= 100'

### schema_1226_202671

```text
syntax error at or near "("
LINE 6:   dnumber      integer(4) not null,
                              ^
```


### schema_1227_189095

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     ID INT NOT NULL AUTO_INCREMENT
                            ^
```


### schema_1228_038090

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `appointments` (
                     ^
```


### schema_1229_458061

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `dev_skills` (
                     ^
```


### schema_1231_368533

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `user` ( 
                     ^
```


### schema_1232_658129

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `abuse_reports` (
                     ^
```


### schema_1237_355236

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `attributes` (
                     ^
```


### schema_1238_617427

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Customer` (
                     ^
```


### schema_1239_638548

```text
syntax error at or near "IDENTITY"
LINE 5:   id         INTEGER IDENTITY PRIMARY KEY,
                             ^
```


### schema_1240_300469

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `addresses_client`
                     ^
```


### schema_1241_258878

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `bills` (
                     ^
```


### schema_1242_249341

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `front_action` (
                     ^
```


### schema_1243_421581

```text
column "verified" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```


### schema_1244_213519

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT NOT NULL AUTO_INCREMENT,
                            ^
```


### schema_1245_589116

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `songs` (
                     ^
```


### schema_1247_508785

```text
syntax error at or near "IDENTITY"
LINE 5:  JOB_INSTANCE_ID BIGINT IDENTITY NOT NULL PRIMARY KEY ,  
                                ^
```


### schema_1251_354516

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_1252_307603

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `drivers`  (
                     ^
```


### schema_1254_666807

```text
syntax error at or near "AUTO_INCREMENT"
LINE 32: loan_id INT AUTO_INCREMENT,
                     ^
```


### schema_1256_060874

```text
type "long" does not exist
LINE 8: PHONE LONG, 
              ^
```


### schema_1257_194099

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      ^
```


### schema_1259_435992

```text
type "longvarbinary" does not exist
LINE 16:     BYTES_ longvarbinary,
                    ^
```


### schema_1260_590060

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_1262_604319

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Department` (
                     ^
```


### schema_1265_471935

```text
type "blob" does not exist
LINE 16:     BYTES_ BLOB,
                    ^
```


### schema_1268_420590

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `tieba_sign_user` (
                     ^
```


### schema_1269_326189

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ActionStrings` (
                     ^
```


### schema_1270_099383

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `cart` (
                     ^
```


### schema_1272_534240

```text
type "clob" does not exist
LINE 23:   STAFF_PASSWORD CLOB NOT NULL,
                          ^
```


### schema_1273_587363

```text
syntax error at or near "#"
LINE 6:  # 用户ID
         ^
```

- Could not parse ground-truth column: '# 用户ID\n\tuserID varchar(10)'
- Could not parse ground-truth column: '# varchar \n\t# 用户名\n\tuserName VARCHAR(32) NOT NULL'
- Could not parse ground-truth column: '# 登录密码\n\tuserPassword VARCHAR(32) NOT NULL'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (userID)'
- Could not parse ground-truth column: '# 工号\n\twaiterID varchar(10)'
- Could not parse ground-truth column: '#varchar\n\t# 姓名\n\twaiterName VARCHAR(32) NOT NULL'
- Could not parse ground-truth column: '# 出生日期\n\twaiterBirthday DATE NOT NULL'
- Could not parse ground-truth column: '# 身份证\n\twaiterIDCard CHAR(18) NOT NULL UNIQUE'
- Could not parse ground-truth column: '# 系统登录密码\n\twaiterPassword VARCHAR(32) NOT NULL'
- Could not parse ground-truth column: '# 入职日期\n\twaiterJoinDate DATE NOT NULL'
- Could not parse ground-truth column: '# 手机\n\twaiterPhoneNumber CHAR(11) UNIQUE'
- Could not parse ground-truth column: '# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (waiterID)'
- Could not parse ground-truth column: '# 会员等级（主码）\n\tlevel smallint'
- Could not parse ground-truth column: '# smallint  LV 1-10\n\t# 享受折扣\n\tdiscount decimal(10,2) unsigned'
- Could not parse ground-truth column: '# 等级对应消费金额\n\ttotalAmount bigint'
- Could not parse ground-truth column: '# bigint\n\t# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (level)'
- Could not parse ground-truth column: '# 房间类型（主码）\n\troomType VARCHAR(32)'
- Could not parse ground-truth column: '# 价格\n\tprice INT UNSIGNED NOT NULL'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (roomType)'
- Could not parse ground-truth column: '# 顾客身份证\n\tcustomerIDCard CHAR(18)'
- Could not parse ground-truth column: "# 性别\n\tcustomerGender CHAR(4) check (customerGender ='男' or customerGender='女')"
- Could not parse ground-truth column: '# 限制 男或女  \n\t# 姓名\n\tcustomerName VARCHAR(16) NOT NULL'
- Could not parse ground-truth column: '# 出生日期\n\tcustomerBirthday DATE'
- Could not parse ground-truth column: '# 会员等级\n\tcustomerVIPLevel smallint'
- Could not parse ground-truth column: '# 改成 smallint \n\t# 手机号码\n\tcustomerPhoneNumber CHAR(11)'
- Could not parse ground-truth column: '# 消费金额\n\ttotalAmount INT UNSIGNED'
- Could not parse ground-truth column: '# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (customerIDCard)'
- Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (customerVIPLevel) REFERENCES VIPLevel(level)'
- Could not parse ground-truth column: '# 房间号（主码）\n\troomNumber CHAR(6)'
- Could not parse ground-truth column: '# 房间类型\n\troomType VARCHAR(32) NOT NULL'
- Could not parse ground-truth column: "# 状态\n\troomStatus CHAR(6) check (roomStatus='空' or roomStatus='非空')"
- Could not parse ground-truth column: '# 空/非空 \n\t# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (roomNumber)'
- Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (roomType) REFERENCES roomTypeAndPrice(roomType)'
- Could not parse ground-truth column: '# 订单号\n\torderNumber CHAR(32) NOT NULL'
- Could not parse ground-truth column: "# 订单状态\n\torderStatus CHAR(18) check (value in ('预订中','已入住','已退房'))"
- Could not parse ground-truth column: '# 客户身份证\n\tcustomerIDCard CHAR(18)'
- Could not parse ground-truth column: '# 入住房间号\n\troomNumber CHAR(6) NOT NULL'
- Could not parse ground-truth column: '# 入住时间\n\tcheckInTime DATE NOT NULL'
- Could not parse ground-truth column: '# 离店时间\n\tcheckOutTime DATE NOT NULL'
- Could not parse ground-truth column: '# 需付金额(由于可能续费，不能作为外键)\n\ttotalMoney INT UNSIGNED NOT NULL'
- Could not parse ground-truth column: '# 服务员工号\n\twaiterID VARCHAR(10) NOT NULL'
- Could not parse ground-truth column: '# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (orderNumber)'
- Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (customerIDCard) REFERENCES customers(customerIDCard)'
- Could not parse ground-truth column: '# 订单号\n\torderNumber CHAR(32)'
- Could not parse ground-truth column: '# 预定时间（订单表中一旦有预定订单加入，那么本表新增一条记录，本字段不可能为空）\n\torderTime DATE NOT NULL'
- Could not parse ground-truth column: '# 实际入住时间\n\tcheckInTime DATE'
- Could not parse ground-truth column: '# 实际退房时间\n\tcheckOutTime DATE'
- Could not parse ground-truth column: '# 备注\n\tremarks VARCHAR(32)'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (orderNumber)'
- Could not parse ground-truth column: '# 同时作为外键\n\tFOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)'
- Could not parse ground-truth column: '# 操作记录号\n\toperatingID INT UNSIGNED AUTO_INCREMENT'
- Could not parse ground-truth column: '# 操作的订单号(是记录中的订单号，外码，参照订单表)\n\torderNumber CHAR(32)'
- Could not parse ground-truth column: '# 住房原到期日期\n\toldExpiryDate DATE NOT NULL'
- Could not parse ground-truth column: '# 住房新到期日期\n\tnewExpiryDate DATE NOT NULL'
- Could not parse ground-truth column: '# 需要添加的金额\n\taddedMoney INT UNSIGNED NOT NULL'
- Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (operatingID)'
- Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)'
- Unresolved or ambiguous constraint identifier: 'roomNumber'
- Unresolved or ambiguous constraint identifier: 'roomNumber'
- Unresolved or ambiguous constraint identifier: 'waiterID'
- Unresolved or ambiguous constraint identifier: 'waiterID'

### schema_1275_254209

```text
there is no unique constraint matching given keys for referenced table "ref_biz_data_inst"
```

- Conflicting overlapping FK parent fixture for 'user_'.
- Conflicting overlapping FK parent fixture for 'user_'.

### schema_1276_694753

```text
syntax error at or near "AUTO_INCREMENT"
LINE 16:     comment_id   INT NOT NULL AUTO_INCREMENT,
                                       ^
```


### schema_1279_031575

```text
syntax error at or near "("
LINE 463:   PRIMARY KEY (ID)
                        ^
```


### schema_1282_521421

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1283_332944

```text
type "double" does not exist
LINE 12:  x DOUBLE NOT NULL,
            ^
```


### schema_1285_375298

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `albums` (
                     ^
```


### schema_1287_022562

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_1289_203345

```text
type "varchar2" does not exist
LINE 5:     key varchar2(1024) NOT NULL,
                ^
```


### schema_1290_211978

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:   id INTEGER PRIMARY KEY AUTOINCREMENT,
                                 ^
```


### schema_1292_596003

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `car` (
                     ^
```


### schema_1293_031816

```text
type "varchar2" does not exist
LINE 5:   id        varchar2(9)  NOT NULL,
                    ^
```


### schema_1295_618406

```text
type "varchar2" does not exist
LINE 6:    SEQUENCE_NAME VARCHAR2(255) NOT NULL,
                         ^
```


### schema_1296_538462

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     ID INT NOT NULL AUTO_INCREMENT
                            ^
```


### schema_1297_191052

```text
type "varchar2" does not exist
LINE 6:  TABLE_NAME            VARCHAR2(20)  NOT NULL ,
                               ^
```


### schema_1298_324181

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `maintenances` (
                     ^
```


### schema_1299_234701

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      ^
```


### schema_1300_274091

```text
type "double" does not exist
LINE 22: ...c2 int not null constraint tab1pk primary key, c3 double, c4...
                                                              ^
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unresolved or ambiguous constraint identifier: 'a'
- Unsupported CHECK expression on 'tab2': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'tab3': 'c2-c3<80' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_4': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_5': 'c2-c3<80' (unsupported CHECK token)
- No bounded CHECK-compatible fixture found for 'atdc_1_constraints'.
- No isolated invalid CHECK witness for atdc_1_constraints: 'c is not null'

### schema_1301_448226

```text
syntax error at or near "identity"
LINE 4: create table T_ACCOUNT (ID integer identity primary key, NUM...
                                           ^
```


### schema_1303_061998

```text
syntax error at or near "engine"
LINE 6:     ) engine=InnoDB;
              ^
```


### schema_1304_492215

```text
syntax error at or near "UNSIGNED"
LINE 6:     id            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PR...
                                 ^
```


### schema_1305_484289

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `countries` (
                     ^
```


### schema_1307_441345

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `classe` (
                     ^
```


### schema_1308_267996

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Person` (
                     ^
```

- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_teacherId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTakes_studentId'
- Unsupported ALTER TABLE constraint: 'DROP major'
- Unsupported ALTER TABLE constraint: 'DROP dept'
- Unsupported ALTER TABLE constraint: 'DROP dept'
- Unsupported ALTER TABLE constraint: 'DROP title'
- Unsupported ALTER TABLE constraint: 'DROP number'
- Unsupported ALTER TABLE constraint: 'DROP numUnits'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_deptId'
- Unsupported ALTER TABLE constraint: 'DROP deptId'
- Unsupported ALTER TABLE constraint: 'ADD COLUMN coordId INT NULL'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_sectionId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTakes_studentId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_sectionId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_teacherId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_courseId'
- Unsupported ALTER TABLE constraint: 'DROP courseId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKCourse_coordId'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKCourse_deptId'
- Unresolved or ambiguous constraint identifier: 'deptId'
- Unresolved or ambiguous constraint identifier: 'courseId'
- Unresolved or ambiguous constraint identifier: 'majorId'
- Unresolved or ambiguous constraint identifier: 'deptId'
- Unresolved or ambiguous constraint identifier: 'coordId'
- No isolated invalid-parent witness for FK Teaches.['teacherId'] -> Person: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK Teaches.['sectionId'] -> Section: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teaches.['sectionId'] -> Section: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teaches.['sectionId'] -> Section: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teaches.['teacherId'] -> Person: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK Takes.['studentId'] -> Person: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK Takes.['studentId'] -> Person: a sibling relationship already guarantees the target parent.

### schema_1309_516625

```text
syntax error at or near "("
LINE 27:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1312_441794

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id int NOT NULL AUTO_INCREMENT,
                            ^
```


### schema_1313_266228

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `account` (
                     ^
```


### schema_1315_574283

```text
type "varchar2" does not exist
LINE 6:  titreS varchar2(100),
                ^
```

- No isolated invalid CHECK witness for series: 'pays is not null'
- No isolated invalid CHECK witness for series: 'dateS is not null'
- No isolated invalid CHECK witness for utilisateur: 'dateI is not null'
- No isolated invalid CHECK witness for episode: 'datedif is not null'
- No isolated invalid CHECK witness for staff: 'nom is not null'
- No isolated invalid CHECK witness for staff: 'prenom is not null'

### schema_1316_174202

```text
syntax error at or near "Identity"
LINE 5:  Id int Identity(1,1) Primary Key Not Null,
                ^
```

- Unsupported CHECK expression on 'Administrator': 'len([PassWord]) >= 6' (unsupported CHECK operator)
- No isolated invalid-parent witness for FK Payment.['MemberId'] -> PaymentType: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Payment.['MemberId'] -> Member: no target-private columns or independent sibling parent.

### schema_1317_514500

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `Teams` (
                     ^
```


### schema_1318_239002

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admin` (
                     ^
```


### schema_1319_042917

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:   userId            BIGINT NOT NULL PRIMARY KEY AUTO_INCREME...
                                                        ^
```


