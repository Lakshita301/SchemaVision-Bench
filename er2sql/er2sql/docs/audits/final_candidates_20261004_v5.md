# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 95/618.

DDL compiles: 258; all finite execution checks pass: 247; technical checks without warnings/blockers pass: 244; conversion review missing: 463.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0164 | False | 0/76 | 14 | False |
| schema_0169 | True | 33/33 | 1 | False |
| schema_0173 | False | 0/37 | 1 | False |
| schema_0177 | True | 22/22 | 1 | False |
| schema_0178 | False | 0/422 | 3 | False |
| schema_0179 | True | 26/26 | 1 | False |
| schema_0181 | False | 0/106 | 58 | False |
| schema_0183 | False | 0/49 | 19 | False |
| schema_0184 | False | 0/91 | 2 | False |
| schema_0185 | False | 0/139 | 2 | False |
| schema_0186 | True | 135/135 | 1 | False |
| schema_0190 | True | 24/24 | 0 | True |
| schema_0191 | False | 0/530 | 1 | False |
| schema_0193 | False | 0/93 | 2 | False |
| schema_0195 | False | 0/281 | 4 | False |
| schema_0196 | False | 0/719 | 2 | False |
| schema_0197 | True | 32/32 | 1 | False |
| schema_0198 | True | 124/126 | 1 | False |
| schema_0200 | True | 104/104 | 0 | True |
| schema_0204 | False | 0/219 | 2 | False |
| schema_0207 | False | 0/62 | 0 | False |
| schema_0208 | False | 0/53 | 2 | False |
| schema_0210 | False | 0/405 | 1 | False |
| schema_0217 | True | 67/67 | 1 | False |
| schema_0218 | True | 81/81 | 1 | False |
| schema_0219 | False | 0/31 | 1 | False |
| schema_0220 | False | 0/46 | 1 | False |
| schema_0221 | True | 76/76 | 1 | False |
| schema_0223 | True | 127/127 | 1 | False |
| schema_0225 | False | 0/104 | 3 | False |
| schema_0226 | True | 99/99 | 1 | False |
| schema_0228 | True | 188/188 | 1 | False |
| schema_0229 | False | 0/219 | 2 | False |
| schema_0230 | False | 0/62 | 1 | False |
| schema_0231 | True | 70/70 | 1 | False |
| schema_0238 | False | 0/60 | 2 | False |
| schema_0240 | True | 34/34 | 1 | False |
| schema_0244 | True | 135/135 | 1 | False |
| schema_0247 | False | 0/117 | 3 | False |
| schema_0248 | True | 135/135 | 1 | False |
| schema_0255 | False | 0/36 | 1 | False |
| schema_0258 | True | 82/82 | 1 | False |
| schema_0264 | True | 32/32 | 1 | False |
| schema_0266 | False | 0/203 | 4 | False |
| schema_0267 | False | 0/149 | 2 | False |
| schema_0269 | False | 0/228 | 1 | False |
| schema_0272 | False | 0/211 | 1 | False |
| schema_0273 | False | 0/430 | 4 | False |
| schema_0274 | True | 83/83 | 1 | False |
| schema_0275 | False | 0/40 | 1 | False |
| schema_0277 | False | 0/92 | 1 | False |
| schema_0279 | False | 0/318 | 7 | False |
| schema_0280 | True | 67/67 | 1 | False |
| schema_0281 | False | 0/163 | 3 | False |
| schema_0282 | True | 33/33 | 1 | False |
| schema_0284 | False | 0/18 | 1 | False |
| schema_0285 | False | 0/33 | 2 | False |
| schema_0286 | True | 76/76 | 1 | False |
| schema_0288 | True | 87/87 | 1 | False |
| schema_0289 | True | 73/73 | 1 | False |
| schema_0290 | False | 0/847 | 4 | False |
| schema_0292 | False | 0/278 | 1 | False |
| schema_0293 | False | 0/144 | 0 | False |
| schema_0294 | True | 26/26 | 1 | False |
| schema_0297 | True | 70/70 | 0 | True |
| schema_0300 | True | 25/25 | 0 | True |
| schema_0302 | True | 76/76 | 1 | False |
| schema_0310 | False | 0/46 | 0 | False |
| schema_0311 | True | 51/51 | 1 | False |
| schema_0314 | True | 36/36 | 0 | True |
| schema_0317 | True | 62/62 | 0 | True |
| schema_0320 | False | 0/462 | 1 | False |
| schema_0325 | True | 61/61 | 0 | True |
| schema_0327 | False | 0/23 | 0 | False |
| schema_0328 | False | 0/157 | 1 | False |
| schema_0329 | False | 0/183 | 0 | False |
| schema_0332 | False | 0/61 | 0 | False |
| schema_0333 | False | 0/94 | 1 | False |
| schema_0335 | True | 23/23 | 1 | False |
| schema_0338 | False | 0/142 | 1 | False |
| schema_0339 | False | 0/158 | 1 | False |
| schema_0343 | False | 0/127 | 2 | False |
| schema_0345 | True | 127/127 | 1 | False |
| schema_0348 | False | 0/523 | 2 | False |
| schema_0349 | False | 0/33 | 1 | False |
| schema_0353 | False | 0/938 | 1 | False |
| schema_0360 | False | 0/54 | 2 | False |
| schema_0366 | False | 0/98 | 1 | False |
| schema_0367 | False | 0/73 | 9 | False |
| schema_0368 | False | 0/52 | 1 | False |
| schema_0369 | True | 20/20 | 1 | False |
| schema_0371 | False | 0/216 | 3 | False |
| schema_0372 | False | 0/80 | 1 | False |
| schema_0375 | False | 0/247 | 16 | False |
| schema_0376 | False | 0/102 | 2 | False |
| schema_0377 | False | 0/219 | 2 | False |
| schema_0378 | False | 0/54 | 2 | False |
| schema_0381 | True | 36/36 | 0 | True |
| schema_0383 | True | 136/136 | 0 | True |
| schema_0384 | False | 0/54 | 0 | False |
| schema_0386 | True | 19/19 | 1 | False |
| schema_0390 | True | 87/87 | 1 | False |
| schema_0391 | True | 44/44 | 1 | False |
| schema_0392 | False | 0/75 | 1 | False |
| schema_0393 | False | 0/40 | 1 | False |
| schema_0398 | False | 0/105 | 1 | False |
| schema_0400 | False | 0/48 | 1 | False |
| schema_0402 | False | 0/30 | 1 | False |
| schema_0403 | False | 0/119 | 1 | False |
| schema_0405 | False | 0/118 | 3 | False |
| schema_0406 | False | 0/570 | 1 | False |
| schema_0409 | False | 0/452 | 13 | False |
| schema_0414 | True | 47/47 | 0 | True |
| schema_0415 | False | 0/91 | 9 | False |
| schema_0419 | True | 32/32 | 1 | False |
| schema_0420 | False | 0/46 | 3 | False |
| schema_0424 | True | 33/33 | 0 | True |
| schema_0425 | True | 135/135 | 1 | False |
| schema_0431 | True | 132/132 | 1 | False |
| schema_0434 | False | 0/564 | 4 | False |
| schema_0436 | False | 0/150 | 1 | False |
| schema_0438 | False | 0/52 | 0 | False |
| schema_0440 | False | 0/130 | 1 | False |
| schema_0443 | False | 0/62 | 2 | False |
| schema_0444 | False | 0/50 | 2 | False |
| schema_0446 | True | 78/78 | 0 | True |
| schema_0449 | False | 0/45 | 1 | False |
| schema_0454 | False | 0/432 | 0 | False |
| schema_0456 | True | 246/246 | 1 | False |
| schema_0457 | True | 37/37 | 0 | True |
| schema_0459 | True | 50/50 | 0 | True |
| schema_0464 | True | 135/135 | 1 | False |
| schema_0465 | False | 0/91 | 0 | False |
| schema_0468 | True | 30/30 | 0 | True |
| schema_0469 | False | 0/149 | 4 | False |
| schema_0470 | False | 0/124 | 1 | False |
| schema_0471 | True | 218/218 | 0 | True |
| schema_0478 | False | 0/76 | 0 | False |
| schema_0481 | True | 25/25 | 0 | True |
| schema_0482 | True | 95/95 | 2 | False |
| schema_0490 | False | 0/179 | 1 | False |
| schema_0491 | False | 0/49 | 10 | False |
| schema_0493 | False | 0/486 | 2 | False |
| schema_0494 | True | 37/37 | 1 | False |
| schema_0496 | True | 45/45 | 1 | False |
| schema_0497 | True | 24/24 | 1 | False |
| schema_0499 | True | 42/42 | 0 | True |
| schema_0503 | True | 519/525 | 1 | False |
| schema_0505 | False | 0/26 | 1 | False |
| schema_0506 | True | 87/87 | 1 | False |
| schema_0507 | False | 0/215 | 3 | False |
| schema_0511 | False | 0/136 | 1 | False |
| schema_0512 | False | 0/459 | 0 | False |
| schema_0513 | True | 172/172 | 1 | False |
| schema_0516 | True | 128/128 | 0 | True |
| schema_0518 | False | 0/217 | 1 | False |
| schema_0521 | True | 0/54 | 2 | False |
| schema_0522 | False | 0/223 | 3 | False |
| schema_0527 | False | 0/278 | 2 | False |
| schema_0530 | False | 0/116 | 3 | False |
| schema_0532 | True | 87/87 | 1 | False |
| schema_0533 | True | 27/27 | 1 | False |
| schema_0535 | False | 0/289 | 4 | False |
| schema_0536 | True | 36/36 | 1 | False |
| schema_0544 | False | 0/418 | 2 | False |
| schema_0549 | False | 0/89 | 1 | False |
| schema_0551 | False | 0/200 | 2 | False |
| schema_0552 | False | 0/45 | 2 | False |
| schema_0555 | False | 0/212 | 2 | False |
| schema_0556 | True | 34/34 | 1 | False |
| schema_0560 | False | 0/552 | 4 | False |
| schema_0563 | True | 48/48 | 0 | True |
| schema_0566 | False | 0/98 | 4 | False |
| schema_0567 | False | 0/177 | 0 | False |
| schema_0570 | False | 0/481 | 4 | False |
| schema_0571 | False | 0/566 | 4 | False |
| schema_0573 | True | 135/135 | 1 | False |
| schema_0575 | True | 124/124 | 1 | False |
| schema_0577 | True | 32/32 | 1 | False |
| schema_0578 | False | 0/525 | 1 | False |
| schema_0580 | True | 49/49 | 1 | False |
| schema_0581 | True | 52/52 | 0 | True |
| schema_0585 | True | 157/157 | 1 | False |
| schema_0591 | True | 67/67 | 0 | True |
| schema_0592 | True | 201/201 | 1 | False |
| schema_0593 | False | 0/194 | 4 | False |
| schema_0597 | False | 0/87 | 2 | False |
| schema_0600 | True | 54/54 | 0 | True |
| schema_0603 | False | 0/202 | 2 | False |
| schema_0604 | False | 0/181 | 3 | False |
| schema_0611 | False | 0/67 | 2 | False |
| schema_0612 | True | 64/66 | 5 | False |
| schema_0614 | False | 0/64 | 1 | False |
| schema_0617 | True | 31/31 | 0 | True |
| schema_0620 | True | 28/28 | 0 | True |
| schema_0621 | True | 44/44 | 1 | False |
| schema_0624 | False | 0/624 | 1 | False |
| schema_0625 | False | 0/299 | 5 | False |
| schema_0627 | True | 25/25 | 0 | True |
| schema_0628 | False | 0/51 | 2 | False |
| schema_0631 | True | 19/19 | 1 | False |
| schema_0633 | True | 135/135 | 1 | False |
| schema_0635 | True | 65/65 | 0 | True |
| schema_0639 | False | 0/64 | 1 | False |
| schema_0642 | False | 0/105 | 3 | False |
| schema_0648 | False | 0/117 | 4 | False |
| schema_0649 | True | 74/74 | 0 | True |
| schema_0651 | True | 392/392 | 1 | False |
| schema_0652 | False | 0/299 | 2 | False |
| schema_0654 | True | 127/127 | 1 | False |
| schema_0655 | False | 0/396 | 3 | False |
| schema_0659 | True | 27/27 | 1 | False |
| schema_0660 | False | 0/208 | 1 | False |
| schema_0661 | False | 0/828 | 1 | False |
| schema_0665 | True | 41/41 | 0 | True |
| schema_0672 | False | 0/63 | 1 | False |
| schema_0673 | False | 0/97 | 2 | False |
| schema_0674 | True | 32/32 | 1 | False |
| schema_0676 | False | 0/68 | 2 | False |
| schema_0678 | True | 32/32 | 0 | True |
| schema_0681 | True | 43/43 | 0 | True |
| schema_0684 | False | 0/300 | 3 | False |
| schema_0685 | True | 35/35 | 1 | False |
| schema_0686 | False | 0/203 | 3 | False |
| schema_0687 | True | 76/76 | 1 | False |
| schema_0688 | True | 32/32 | 1 | False |
| schema_0694 | False | 0/99 | 0 | False |
| schema_0696 | False | 0/278 | 3 | False |
| schema_0699 | False | 0/101 | 1 | False |
| schema_0701 | False | 0/134 | 1 | False |
| schema_0702 | True | 188/188 | 0 | True |
| schema_0704 | True | 129/129 | 0 | True |
| schema_0706 | False | 0/52 | 1 | False |
| schema_0724 | True | 33/33 | 1 | False |
| schema_0725 | False | 0/29 | 1 | False |
| schema_0727 | False | 0/104 | 0 | False |
| schema_0728 | True | 49/49 | 0 | True |
| schema_0731 | False | 0/79 | 0 | False |
| schema_0732 | False | 0/113 | 5 | False |
| schema_0733 | True | 48/48 | 0 | True |
| schema_0734 | False | 0/25 | 4 | False |
| schema_0737 | False | 0/102 | 2 | False |
| schema_0738 | False | 0/101 | 1 | False |
| schema_0740 | False | 0/462 | 1 | False |
| schema_0742 | False | 0/743 | 5 | False |
| schema_0745 | False | 0/283 | 0 | False |
| schema_0751 | True | 34/34 | 1 | False |
| schema_0755 | False | 0/104 | 1 | False |
| schema_0756 | True | 140/140 | 1 | False |
| schema_0761 | False | 0/209 | 0 | False |
| schema_0762 | False | 0/361 | 2 | False |
| schema_0764 | False | 0/70 | 2 | False |
| schema_0772 | False | 0/179 | 3 | False |
| schema_0775 | False | 0/55 | 2 | False |
| schema_0777 | True | 76/76 | 1 | False |
| schema_0778 | False | 0/37 | 1 | False |
| schema_0781 | False | 0/190 | 3 | False |
| schema_0782 | True | 30/30 | 1 | False |
| schema_0784 | True | 45/45 | 1 | False |
| schema_0786 | False | 0/84 | 2 | False |
| schema_0788 | False | 0/352 | 3 | False |
| schema_0790 | False | 0/123 | 2 | False |
| schema_0792 | True | 135/135 | 1 | False |
| schema_0793 | True | 188/188 | 0 | True |
| schema_0795 | True | 65/65 | 0 | True |
| schema_0796 | False | 0/79 | 2 | False |
| schema_0798 | True | 41/41 | 1 | False |
| schema_0799 | True | 201/201 | 0 | True |
| schema_0800 | False | 0/46 | 0 | False |
| schema_0802 | False | 0/245 | 1 | False |
| schema_0804 | False | 0/51 | 0 | False |
| schema_0805 | False | 0/62 | 0 | False |
| schema_0807 | False | 0/202 | 1 | False |
| schema_0809 | True | 93/93 | 1 | False |
| schema_0813 | False | 0/56 | 2 | False |
| schema_0814 | False | 0/71 | 1 | False |
| schema_0815 | True | 181/181 | 0 | True |
| schema_0816 | True | 50/50 | 0 | True |
| schema_0817 | False | 0/56 | 0 | False |
| schema_0819 | False | 0/135 | 1 | False |
| schema_0820 | False | 0/1027 | 2 | False |
| schema_0822 | True | 25/25 | 0 | True |
| schema_0823 | False | 0/54 | 2 | False |
| schema_0829 | False | 0/111 | 2 | False |
| schema_0830 | False | 0/245 | 1 | False |
| schema_0831 | False | 0/84 | 2 | False |
| schema_0836 | True | 57/57 | 1 | False |
| schema_0837 | True | 61/61 | 1 | False |
| schema_0842 | False | 0/21 | 0 | False |
| schema_0843 | False | 0/205 | 1 | False |
| schema_0845 | False | 0/39 | 0 | False |
| schema_0846 | True | 28/28 | 0 | True |
| schema_0847 | False | 0/55 | 3 | False |
| schema_0849 | False | 0/231 | 3 | False |
| schema_0858 | False | 0/56 | 1 | False |
| schema_0859 | False | 0/193 | 3 | False |
| schema_0870 | True | 135/135 | 1 | False |
| schema_0871 | True | 510/514 | 1 | False |
| schema_0874 | False | 0/234 | 2 | False |
| schema_0876 | True | 32/32 | 1 | False |
| schema_0879 | True | 208/208 | 1 | False |
| schema_0881 | False | 0/40 | 0 | False |
| schema_0883 | False | 0/32 | 2 | False |
| schema_0884 | True | 83/83 | 1 | False |
| schema_0889 | False | 0/57 | 4 | False |
| schema_0890 | False | 0/104 | 3 | False |
| schema_0893 | True | 76/76 | 1 | False |
| schema_0899 | True | 729/1375 | 651 | False |
| schema_0900_455237 | True | 181/181 | 0 | True |
| schema_0901_196592 | False | 0/43 | 1 | False |
| schema_0902_537610 | False | 0/505 | 1 | False |
| schema_0903_641274 | False | 0/97 | 1 | False |
| schema_0906_691670 | True | 28/28 | 1 | False |
| schema_0907_160745 | False | 0/234 | 2 | False |
| schema_0908_595029 | False | 0/83 | 1 | False |
| schema_0909_091015 | False | 0/54 | 2 | False |
| schema_0910_646654 | False | 0/23 | 3 | False |
| schema_0911_351848 | False | 0/62 | 1 | False |
| schema_0912_623966 | False | 0/36 | 1 | False |
| schema_0913_078250 | True | 20/20 | 0 | True |
| schema_0914_546220 | True | 218/218 | 0 | True |
| schema_0917_538663 | False | 0/619 | 4 | False |
| schema_0918_205842 | False | 0/656 | 2 | False |
| schema_0921_180722 | False | 0/289 | 2 | False |
| schema_0922_290577 | False | 0/231 | 1 | False |
| schema_0923_391323 | False | 0/50 | 2 | False |
| schema_0924_372982 | False | 0/211 | 6 | False |
| schema_0925_652965 | False | 0/855 | 1 | False |
| schema_0926_444961 | False | 0/94 | 2 | False |
| schema_0927_432405 | False | 0/308 | 2 | False |
| schema_0928_520831 | False | 0/106 | 1 | False |
| schema_0929_108090 | True | 65/65 | 1 | False |
| schema_0930_662565 | False | 0/44 | 0 | False |
| schema_0931_468046 | True | 97/97 | 1 | False |
| schema_0932_662552 | False | 0/430 | 2 | False |
| schema_0933_155171 | True | 452/453 | 1 | False |
| schema_0934_326686 | False | 0/83 | 2 | False |
| schema_0936_106723 | True | 52/52 | 0 | True |
| schema_0937_462804 | True | 218/218 | 0 | True |
| schema_0940_549205 | False | 0/124 | 1 | False |
| schema_0941_659846 | True | 39/39 | 1 | False |
| schema_0942_150757 | False | 0/38 | 1 | False |
| schema_0943_664647 | False | 0/91 | 4 | False |
| schema_0945_570272 | False | 0/55 | 0 | False |
| schema_0948_005703 | True | 118/118 | 0 | True |
| schema_0949_136361 | True | 65/65 | 0 | True |
| schema_0950_614366 | True | 167/167 | 1 | False |
| schema_0952_402169 | False | 0/53 | 1 | False |
| schema_0954_100853 | False | 0/66 | 1 | False |
| schema_0955_026069 | True | 211/211 | 0 | True |
| schema_0956_120022 | True | 320/320 | 0 | True |
| schema_0957_512086 | False | 0/283 | 1 | False |
| schema_0959_117562 | True | 25/25 | 1 | False |
| schema_0960_326291 | False | 0/112 | 3 | False |
| schema_0961_403740 | True | 118/118 | 1 | False |
| schema_0963_525760 | True | 31/31 | 0 | True |
| schema_0964_547031 | True | 88/88 | 1 | False |
| schema_0966_604469 | False | 0/234 | 3 | False |
| schema_0967_047078 | False | 0/2090 | 2 | False |
| schema_0968_637990 | False | 0/284 | 5 | False |
| schema_0969_144544 | True | 138/138 | 0 | True |
| schema_0970_235129 | True | 36/36 | 0 | True |
| schema_0971_260892 | False | 0/209 | 1 | False |
| schema_0972_309020 | False | 0/19 | 33 | False |
| schema_0973_254233 | True | 21/21 | 1 | False |
| schema_0974_336891 | False | 0/40 | 4 | False |
| schema_0975_324672 | False | 0/27 | 0 | False |
| schema_0976_390037 | False | 0/32 | 0 | False |
| schema_0977_609312 | True | 19/19 | 1 | False |
| schema_0978_482243 | True | 135/135 | 1 | False |
| schema_0980_471690 | True | 30/30 | 0 | True |
| schema_0983_295376 | False | 0/19 | 1 | False |
| schema_0984_334739 | True | 78/78 | 1 | False |
| schema_0985_051832 | True | 52/52 | 0 | True |
| schema_0987_242178 | False | 0/66 | 1 | False |
| schema_0989_143776 | True | 38/38 | 1 | False |
| schema_0990_174588 | False | 0/115 | 2 | False |
| schema_0991_336216 | False | 0/118 | 0 | False |
| schema_0992_027652 | True | 29/29 | 0 | True |
| schema_0993_348884 | False | 0/52 | 1 | False |
| schema_0994_684903 | True | 138/138 | 1 | False |
| schema_0995_401888 | False | 0/208 | 1 | False |
| schema_0996_541548 | False | 0/279 | 1 | False |
| schema_0999_062302 | True | 76/76 | 1 | False |
| schema_1000_617352 | False | 0/633 | 1 | False |
| schema_1001_022172 | True | 33/33 | 0 | True |
| schema_1002_179110 | False | 0/120 | 1 | False |
| schema_1003_014791 | True | 15/15 | 0 | True |
| schema_1004_219344 | False | 0/27 | 3 | False |
| schema_1005_570602 | False | 0/81 | 3 | False |
| schema_1007_497366 | True | 15/15 | 0 | True |
| schema_1008_176453 | True | 135/135 | 1 | False |
| schema_1009_358090 | True | 32/32 | 1 | False |
| schema_1010_080239 | False | 0/618 | 0 | False |
| schema_1011_386375 | True | 28/28 | 1 | False |
| schema_1012_059331 | False | 0/42 | 1 | False |
| schema_1013_441410 | True | 135/135 | 1 | False |
| schema_1014_183534 | False | 0/1017 | 1 | False |
| schema_1015_545494 | True | 28/28 | 1 | False |
| schema_1019_073065 | True | 45/45 | 0 | True |
| schema_1020_184540 | False | 0/230 | 3 | False |
| schema_1021_493175 | False | 0/51 | 2 | False |
| schema_1022_393548 | False | 0/222 | 4 | False |
| schema_1023_473037 | False | 0/135 | 1 | False |
| schema_1025_400667 | False | 0/34 | 1 | False |
| schema_1027_665032 | False | 0/37 | 2 | False |
| schema_1029_554720 | True | 28/28 | 1 | False |
| schema_1030_245326 | False | 0/166 | 3 | False |
| schema_1031_610804 | False | 0/604 | 2 | False |
| schema_1032_033274 | False | 0/67 | 5 | False |
| schema_1033_362362 | False | 0/33 | 1 | False |
| schema_1034_531024 | True | 105/105 | 1 | False |
| schema_1035_417385 | False | 0/82 | 0 | False |
| schema_1036_289819 | False | 0/90 | 1 | False |
| schema_1037_521203 | False | 0/362 | 4 | False |
| schema_1039_413086 | True | 181/181 | 0 | True |
| schema_1040_447479 | True | 29/29 | 0 | True |
| schema_1041_644261 | False | 0/52 | 1 | False |
| schema_1042_624410 | False | 0/54 | 2 | False |
| schema_1043_118618 | True | 50/50 | 1 | False |
| schema_1044_019860 | False | 0/118 | 4 | False |
| schema_1045_476826 | True | 52/52 | 0 | True |
| schema_1046_287891 | False | 0/135 | 1 | False |
| schema_1047_207965 | True | 45/45 | 1 | False |
| schema_1050_198025 | True | 32/32 | 0 | True |
| schema_1051_259055 | False | 0/55 | 2 | False |
| schema_1053_675929 | False | 0/123 | 4 | False |
| schema_1055_080731 | False | 0/505 | 1 | False |
| schema_1057_542634 | True | 63/63 | 0 | True |
| schema_1058_453330 | True | 61/61 | 0 | True |
| schema_1059_346369 | False | 0/74 | 0 | False |
| schema_1061_295385 | False | 0/258 | 5 | False |
| schema_1063_000018 | False | 0/447 | 0 | False |
| schema_1064_281329 | True | 47/47 | 0 | True |
| schema_1065_270846 | True | 259/259 | 0 | True |
| schema_1066_508844 | True | 45/45 | 0 | True |
| schema_1068_491851 | False | 0/193 | 2 | False |
| schema_1070_336136 | True | 91/91 | 1 | False |
| schema_1072_659835 | False | 0/342 | 1 | False |
| schema_1073_314345 | False | 0/245 | 1 | False |
| schema_1074_270875 | False | 0/134 | 2 | False |
| schema_1075_084716 | True | 135/135 | 1 | False |
| schema_1076_260105 | True | 16/16 | 0 | True |
| schema_1077_338588 | True | 40/40 | 1 | False |
| schema_1078_600014 | False | 0/245 | 1 | False |
| schema_1079_213377 | True | 203/203 | 1 | False |
| schema_1080_520449 | False | 0/110 | 2 | False |
| schema_1081_289414 | True | 83/83 | 1 | False |
| schema_1082_167670 | True | 165/165 | 1 | False |
| schema_1083_674851 | False | 0/118 | 1 | False |
| schema_1084_417202 | True | 45/45 | 1 | False |
| schema_1085_378499 | True | 63/63 | 0 | True |
| schema_1086_656955 | True | 21/21 | 1 | False |
| schema_1087_556070 | False | 0/119 | 2 | False |
| schema_1088_326764 | False | 0/40 | 3 | False |
| schema_1091_085280 | False | 0/127 | 1 | False |
| schema_1092_364010 | False | 0/543 | 1 | False |
| schema_1096_483661 | False | 0/307 | 3 | False |
| schema_1097_348151 | False | 0/198 | 1 | False |
| schema_1099_654747 | False | 0/33 | 1 | False |
| schema_1100_299606 | False | 0/1149 | 2 | False |
| schema_1101_650753 | True | 152/152 | 4 | False |
| schema_1102_682811 | False | 0/234 | 2 | False |
| schema_1103_115675 | False | 0/37 | 1 | False |
| schema_1105_583941 | False | 0/542 | 1 | False |
| schema_1107_641976 | True | 20/20 | 0 | True |
| schema_1108_251945 | False | 0/110 | 3 | False |
| schema_1109_387896 | True | 33/33 | 1 | False |
| schema_1110_493927 | True | 34/34 | 1 | False |
| schema_1111_287457 | False | 0/43 | 0 | False |
| schema_1112_007491 | True | 730/732 | 1 | False |
| schema_1116_107207 | False | 0/385 | 2 | False |
| schema_1117_622224 | True | 136/136 | 1 | False |
| schema_1118_276995 | False | 0/23 | 1 | False |
| schema_1120_301595 | True | 62/62 | 1 | False |
| schema_1122_217285 | False | 0/1053 | 2 | False |
| schema_1123_278484 | True | 24/24 | 1 | False |
| schema_1125_512036 | False | 0/66 | 0 | False |
| schema_1127_354281 | False | 0/46 | 0 | False |
| schema_1131_139527 | False | 0/132 | 1 | False |
| schema_1132_005273 | True | 135/135 | 1 | False |
| schema_1133_264586 | False | 0/385 | 2 | False |
| schema_1134_654205 | True | 33/33 | 0 | True |
| schema_1136_010581 | True | 21/21 | 0 | True |
| schema_1137_334854 | False | 0/122 | 3 | False |
| schema_1138_419494 | True | 101/101 | 1 | False |
| schema_1139_103727 | True | 65/65 | 1 | False |
| schema_1140_555588 | True | 52/52 | 0 | True |
| schema_1142_235666 | True | 140/140 | 1 | False |
| schema_1145_561835 | False | 0/15 | 0 | False |
| schema_1146_454496 | True | 41/41 | 1 | False |
| schema_1147_662225 | True | 115/115 | 0 | True |
| schema_1148_575663 | False | 0/37 | 1 | False |
| schema_1150_217837 | True | 102/102 | 1 | False |
| schema_1151_048516 | False | 0/956 | 2 | False |
| schema_1152_259631 | False | 0/97 | 9 | False |
| schema_1154_693691 | False | 0/107 | 2 | False |
| schema_1155_119431 | False | 0/385 | 2 | False |
| schema_1157_113711 | False | 0/72 | 1 | False |
| schema_1158_367517 | False | 0/19 | 1 | False |
| schema_1160_679413 | False | 0/162 | 1 | False |
| schema_1161_297667 | False | 0/56 | 1 | False |
| schema_1162_166427 | False | 0/50 | 1 | False |
| schema_1163_147317 | True | 56/56 | 1 | False |
| schema_1165_522626 | False | 0/86 | 1 | False |
| schema_1166_118993 | False | 0/135 | 2 | False |
| schema_1169_027702 | False | 0/179 | 11 | False |
| schema_1170_055247 | True | 59/59 | 0 | True |
| schema_1172_394848 | False | 0/124 | 3 | False |
| schema_1173_307431 | True | 78/105 | 2 | False |
| schema_1174_475536 | False | 0/207 | 3 | False |
| schema_1175_025608 | False | 0/70 | 2 | False |
| schema_1176_594644 | False | 0/162 | 1 | False |
| schema_1177_433889 | False | 0/145 | 1 | False |
| schema_1178_485121 | True | 72/72 | 1 | False |
| schema_1179_497840 | True | 81/81 | 1 | False |
| schema_1182_162164 | False | 0/25 | 2 | False |
| schema_1183_499639 | False | 0/35 | 1 | False |
| schema_1184_316974 | True | 127/127 | 1 | False |
| schema_1185_600277 | True | 157/157 | 0 | True |
| schema_1187_124428 | True | 33/33 | 1 | False |
| schema_1189_344012 | False | 0/112 | 0 | False |
| schema_1190_414439 | False | 0/175 | 0 | False |
| schema_1192_006290 | True | 33/33 | 1 | False |
| schema_1193_607463 | True | 82/82 | 1 | False |
| schema_1195_063455 | False | 0/70 | 2 | False |
| schema_1196_356982 | False | 0/226 | 1 | False |
| schema_1197_304772 | False | 0/859 | 2 | False |
| schema_1198_283986 | True | 33/33 | 1 | False |
| schema_1199_239178 | False | 0/129 | 2 | False |
| schema_1201_239756 | False | 0/1297 | 2 | False |
| schema_1202_625711 | False | 0/124 | 2 | False |
| schema_1204_415528 | True | 47/47 | 0 | True |
| schema_1205_030960 | False | 0/204 | 1 | False |
| schema_1207_239489 | False | 0/27 | 2 | False |
| schema_1214_130697 | True | 32/32 | 1 | False |
| schema_1215_126567 | True | 69/69 | 0 | True |
| schema_1216_629322 | False | 0/432 | 0 | False |
| schema_1218_654100 | True | 71/71 | 0 | True |
| schema_1219_660727 | True | 123/123 | 1 | False |
| schema_1220_019171 | False | 0/347 | 2 | False |
| schema_1221_233519 | False | 0/28 | 3 | False |
| schema_1222_039356 | False | 0/44 | 0 | False |
| schema_1223_109688 | False | 0/66 | 3 | False |
| schema_1224_512880 | True | 20/36 | 2 | False |
| schema_1226_202671 | True | 65/65 | 1 | False |
| schema_1227_189095 | False | 0/76 | 1 | False |
| schema_1228_038090 | False | 0/64 | 1 | False |
| schema_1229_458061 | False | 0/39 | 3 | False |
| schema_1230_271126 | True | 36/36 | 0 | True |
| schema_1231_368533 | True | 167/167 | 1 | False |
| schema_1232_658129 | False | 0/460 | 2 | False |
| schema_1233_471360 | True | 23/23 | 0 | True |
| schema_1235_589752 | True | 34/34 | 0 | True |
| schema_1237_355236 | False | 0/493 | 4 | False |
| schema_1238_617427 | False | 0/117 | 37 | False |
| schema_1239_638548 | False | 0/52 | 1 | False |
| schema_1240_300469 | False | 0/311 | 1 | False |
| schema_1241_258878 | False | 0/104 | 3 | False |
| schema_1242_249341 | False | 0/118 | 4 | False |
| schema_1243_421581 | False | 0/108 | 0 | False |
| schema_1245_589116 | False | 0/43 | 3 | False |
| schema_1246_144281 | True | 65/65 | 0 | True |
| schema_1247_508785 | False | 0/86 | 1 | False |
| schema_1249_289041 | True | 46/46 | 0 | True |
| schema_1251_354516 | True | 76/76 | 1 | False |
| schema_1252_307603 | False | 0/44 | 4 | False |
| schema_1254_666807 | True | 80/80 | 1 | False |
| schema_1256_060874 | False | 0/41 | 0 | False |
| schema_1257_194099 | True | 32/32 | 1 | False |
| schema_1258_595289 | True | 38/38 | 0 | True |
| schema_1259_435992 | False | 0/217 | 1 | False |
| schema_1260_590060 | True | 76/76 | 1 | False |
| schema_1261_504413 | True | 40/40 | 0 | True |
| schema_1262_604319 | True | 91/91 | 1 | False |
| schema_1264_630818 | False | 0/304 | 5 | False |
| schema_1265_471935 | False | 0/217 | 1 | False |
| schema_1267_558937 | True | 50/50 | 0 | True |
| schema_1268_420590 | False | 0/58 | 4 | False |
| schema_1269_326189 | False | 0/385 | 2 | False |
| schema_1270_099383 | False | 0/57 | 2 | False |
| schema_1271_476007 | True | 85/85 | 0 | True |
| schema_1272_534240 | True | 192/192 | 1 | False |
| schema_1273_587363 | False | 0/17 | 127 | False |
| schema_1274_327667 | True | 45/45 | 0 | True |
| schema_1275_254209 | False | 0/1155 | 0 | False |
| schema_1276_694753 | True | 37/37 | 1 | False |
| schema_1278_640451 | True | 44/44 | 0 | True |
| schema_1279_031575 | False | 0/538 | 1 | False |
| schema_1282_521421 | False | 0/447 | 0 | False |
| schema_1283_332944 | True | 68/68 | 1 | False |
| schema_1285_375298 | False | 0/131 | 2 | False |
| schema_1287_022562 | False | 0/54 | 2 | False |
| schema_1289_203345 | False | 0/83 | 1 | False |
| schema_1290_211978 | True | 33/33 | 1 | False |
| schema_1292_596003 | False | 0/57 | 2 | False |
| schema_1293_031816 | True | 83/83 | 1 | False |
| schema_1295_618406 | False | 0/462 | 1 | False |
| schema_1296_538462 | False | 0/37 | 1 | False |
| schema_1297_191052 | True | 143/143 | 1 | False |
| schema_1298_324181 | False | 0/2349 | 4 | False |
| schema_1299_234701 | True | 35/35 | 1 | False |
| schema_1300_274091 | False | 0/246 | 10 | False |
| schema_1301_448226 | True | 61/61 | 1 | False |
| schema_1302_102857 | True | 22/22 | 0 | True |
| schema_1303_061998 | True | 89/89 | 1 | False |
| schema_1304_492215 | False | 0/129 | 5 | False |
| schema_1305_484289 | False | 0/44 | 1 | False |
| schema_1306_204751 | True | 330/330 | 0 | True |
| schema_1307_441345 | False | 0/38 | 1 | False |
| schema_1308_267996 | False | 0/105 | 53 | False |
| schema_1309_516625 | True | 135/135 | 1 | False |
| schema_1312_441794 | True | 34/34 | 1 | False |
| schema_1313_266228 | False | 0/45 | 4 | False |
| schema_1315_574283 | True | 107/108 | 7 | False |
| schema_1317_514500 | True | 27/27 | 1 | False |
| schema_1318_239002 | False | 0/153 | 1 | False |
| schema_1319_042917 | False | 0/35 | 1 | False |

## Blocker details

### schema_0164

```text
syntax error at or near "FOREIGN"
LINE 77: ALTER TABLE venue DROP FOREIGN KEY fk_manager_id;
                                ^
```

- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY fk_manager_id'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_1'
- No isolated invalid-parent witness for overlapping FK venue.['manager_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK venue.['manager_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK checkin.['venue_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK checkin.['indi_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK checkin.['venue_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK checkin.['indi_id']; no target-private columns.
- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY fk_manager_id'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_1'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0169

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0173

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0177

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0178

```text
syntax error at or near "unsigned"
LINE 47:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                      ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0179

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0181

```text
syntax error at or near "unsigned"
LINE 52:     Price_per_Unit int unsigned DEFAULT 0,
                                ^
```

- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- Unsupported CHECK expression on 'CUSTOMER': '(Admin_Assisstance_Feedback)>=0 AND (Admin_Assisstance_Feedback)<=5' (unsupported CHECK operator)
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'ADMIN': NOT NULL self-referencing/cyclic foreign key ['Reported_Admin_ID'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0183

```text
syntax error at or near "FOREIGN"
LINE 53: ALTER TABLE article DROP FOREIGN KEY article_ibfk_1;
                                  ^
```

- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY article_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_2'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY article_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_1'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_2'
- No isolated invalid-parent witness for overlapping FK article.['article_author']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK article.['article_author']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['comments_author']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['article_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['parent_comment']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['parent_comment']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['comments_author']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comments.['article_id']; no target-private columns.
- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY article_ibfk_1'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_1'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY comments_ibfk_2'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0184

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0185

```text
column "G" does not exist
LINE 12:     CHECK (rating = "G" OR rating = "PG" OR rating = "PG-13"...
                             ^
```

- Unsupported CHECK expression on 'Movie': 'rating = "G" OR rating = "PG" OR rating = "PG-13" OR rating = "R" OR rating = "NC-17"' (unknown column)
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0186

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0191

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0193

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0195

```text
syntax error at or near "unsigned"
LINE 4:     "id" INTEGER unsigned NOT NULL AUTO_INCREMENT,
                         ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0196

```text
syntax error at or near "ENGINE"
LINE 193: ) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
            ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0197

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0198

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 2}

### schema_0204

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0207

```text
relation "park_park_id_seq" does not exist
LINE 5:   park_id integer DEFAULT nextval('park_park_id_seq'::regcla...
                                          ^
```


### schema_0208

```text
type "titles" does not exist
LINE 6:     "title" titles,
                    ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0210

```text
syntax error at or near "/"
LINE 11: )/
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0217

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0218

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0219

```text
there is no unique constraint matching given keys for referenced table "users_tb"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0220

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0221

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0223

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0225

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0226

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0228

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0229

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0230

```text
type "string" does not exist
LINE 18:     profile STRING
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0231

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0238

```text
syntax error at or near "ON"
LINE 8: ...amp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0240

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0244

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0247

```text
relation "students" already exists
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0248

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0255

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0258

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0264

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0266

```text
syntax error at or near "unsigned"
LINE 4:     "id" bigint unsigned NOT NULL AUTO_INCREMENT,
                        ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0267

```text
type "enum" does not exist
LINE 75:     "type" enum('talk','workshop') NOT NULL,
                    ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0269

```text
there is no unique constraint matching given keys for referenced table "service_reservation"
```

- No isolated invalid-parent witness for overlapping FK ROOM_REVIEW.['HotelID', 'RoomNo']; no target-private columns.

### schema_0272

```text
syntax error at or near "ENGINE"
LINE 20: ) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0273

```text
syntax error at or near "ENGINE"
LINE 37: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0274

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0275

```text
constraint "cust_ref_info_pk" for relation "customer_reference_information" already exists
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0277

```text
there is no unique constraint matching given keys for referenced table "restaurants"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0279

```text
syntax error at or near "ON"
LINE 25: ...ATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                              ^
```

- No isolated invalid-parent witness for overlapping FK image_job.['ADS_ID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK image_job.['ADS_ID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK report_ads.['REPORT_ID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK report_ads.['REPORT_ID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK report_ads.['REPORT_ID']; no target-private columns.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0280

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0281

```text
syntax error at or near "ON"
LINE 19: ...ime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                              ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0282

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0284

```text
type "bin" does not exist
LINE 19:     chunk bin(127)
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0285

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0286

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0288

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0289

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0290

```text
syntax error at or near "unsigned"
LINE 29:     "Sequence_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
                                  ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0292

```text
there is no unique constraint matching given keys for referenced table "pagina"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0293

```text
there is no unique constraint matching given keys for referenced table "photo"
```


### schema_0294

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0302

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0310

```text
syntax error at or near "user"
LINE 8:     user TEXT,
            ^
```


### schema_0311

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0320

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0327

```text
schema "cloud" does not exist
LINE 4: CREATE TABLE cloud.users (
                     ^
```


### schema_0328

```text
syntax error at or near "("
LINE 112:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                    ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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
canceling statement due to statement timeout
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0335

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0338

```text
column "disability" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0339

```text
syntax error at or near ","
LINE 67:     Interest float(10,2) not null,
                              ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0343

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLAT...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0345

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0348

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0349

```text
there is no unique constraint matching given keys for referenced table "acct_role"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0353

```text
syntax error at or near "CHAR"
LINE 6:     ATTRIBUTE_NAME VARCHAR(255 CHAR),
                                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0360

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0366

```text
column "created_on" is of type timestamp without time zone but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0367

```text
syntax error at or near ","
LINE 18:     files_rights_id,
                            ^
```

- Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Could not determine data type for 'usvn_users_to_groups.users_id'.
- Could not determine data type for 'usvn_users_to_projects.users_id'.
- Normalization blocker: Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Normalization blocker: Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Normalization blocker: Could not determine data type for 'usvn_users_to_groups.users_id'.
- Normalization blocker: Could not determine data type for 'usvn_users_to_projects.users_id'.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0368

```text
type "varchar_ignorecase" does not exist
LINE 28:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0369

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0371

```text
syntax error at or near "IDENTITY"
LINE 174:     LOG_NR_ numeric(19,0) IDENTITY(1,1),
                                    ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0372

```text
there is no unique constraint matching given keys for referenced table "specialties"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0375

```text
syntax error at or near "#"
LINE 5:     #auto_increment=0，但是只能后续设置
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
- Normalization blocker: Could not parse ground-truth column: '#auto_increment=0，但是只能后续设置\n    STATE varchar(4)'
- Normalization blocker: Could not parse ground-truth column: '#分区id不需要自增，直接初始定义即可，但还是修改为int型\n    ZONE_NAME varchar(10)'
- Normalization blocker: Could not parse ground-truth column: '# 1000-01-01 00:00:00\n    ZONE_ID int'
- Normalization blocker: Could not parse ground-truth column: '#1000-01-01 00:00:00\n    primary key (USER_ID, ALBUM_ID, ALBUM_VISIT_TIME)'
- Normalization blocker: Could not parse ground-truth column: '#1000-01-01 00:00:00\n    ZONE_ID int'
- Normalization blocker: Could not parse ground-truth column: '##之前没有这个\n    primary key (MESSAGE_ID, USER_ID)'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'ZONE_ID'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0376

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
          ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0377

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0378

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0384

```text
syntax error at or near "("
LINE 18:  INDEX (socialSecurityNumber),
                ^
```


### schema_0386

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0390

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0391

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0392

```text
syntax error at or near "Type"
LINE 15: )Type=InnoDB;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0393

```text
there is no unique constraint matching given keys for referenced table "gender"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0398

```text
there is no unique constraint matching given keys for referenced table "TB_USER"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0400

```text
there is no unique constraint matching given keys for referenced table "terminal"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0402

```text
syntax error at or near "CHARACTER"
LINE 4:     "userName" varchar(45) CHARACTER SET utf8 NOT NULL,
                                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0403

```text
column "member" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0405

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0406

```text
schema "eco" does not exist
LINE 4: CREATE TABLE eco.db (
                     ^
```

- Unsupported CHECK expression on 'soil_component': 'coalesce(frac_vfine, 0) + coalesce(frac_fine, 0) + coalesce(frac_med, 0) +\n           coalesce(frac_coarse, 0) + coalesce(frac_vcoarse, 0) BETWEEN 0 AND 1' (unsupported CHECK token)

### schema_0409

```text
type "public.eth_tx_attempts_state" does not exist
LINE 68:     state public.eth_tx_attempts_state NOT NULL,
                   ^
```

- Unsupported CHECK expression on 'eth_receipts': '((octet_length(tx_hash) = 32) AND (octet_length(block_hash) = 32))' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_tx_attempts': '((broadcast_before_block_num IS NULL) OR (broadcast_before_block_num > 0))' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_tx_attempts': "(((state = 'in_progress'::public.eth_tx_attempts_state) AND (broadcast_before_block_num IS NULL)) OR (state = 'broadcast'::public.eth_tx_attempts_state))" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(signed_raw_tx) > 0)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_txes': "(broadcast_at > '2019-01-01 00:00:00+00'::timestamp with time zone)" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_txes': '((error IS NULL) OR (length(error) > 0))' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_txes': "(((state = 'unstarted'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'in_progress'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'fatal_error'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NOT NULL) AND (broadcast_at IS NULL))) OR ((state = 'unconfirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))) OR ((state = 'confirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))))" (unsupported CHECK token)
- Unsupported CHECK expression on 'eth_txes': '(octet_length(from_address) = 20)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'eth_txes': '(octet_length(to_address) = 20)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'heads': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'heads': '(octet_length(parent_hash) = 32)' (unsupported CHECK operator)
- Unsupported CHECK expression on 'keys': '(octet_length(address) = 20)' (unsupported CHECK operator)

### schema_0415

```text
operator does not exist: boolean = integer
LINE 44:     CHECK (locked IN (0, 1)),
                           ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
```

- No isolated invalid CHECK witness for instances: 'locked IN (0, 1)'
- No isolated invalid CHECK witness for instances: 'deleted IN (0, 1)'
- No isolated invalid CHECK witness for networks: 'injected IN (0, 1)'
- No isolated invalid CHECK witness for networks: 'deleted IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'reserved IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'allocated IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'leased IN (0, 1)'
- No isolated invalid CHECK witness for fixed_ips: 'deleted IN (0, 1)'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0419

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0420

```text
type "double" does not exist
LINE 12:     LowerPriceLimit DOUBLE(10,2),
                             ^
```

- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0425

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0431

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0434

```text
syntax error at or near "unsigned"
LINE 71:     "process_pid" INTEGER unsigned DEFAULT NULL,
                                   ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0436

```text
there is no unique constraint matching given keys for referenced table "user_info"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0438

```text
schema "container" does not exist
LINE 4: CREATE TABLE CONTAINER.ASSIGNMENT (
                     ^
```


### schema_0440

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0443

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0444

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0449

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0454

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_0456

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0464

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0465

```text
type "_gender" does not exist
LINE 8:  gtype _GENDER NOT NULL,
               ^
```


### schema_0469

```text
syntax error at or near "KEY"
LINE 34:     constraint ra_uk_cons_name UNIQUE KEY (ra_name),
                                               ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0470

```text
syntax error at or near ")"
LINE 16: ...omment_date" timestamp NOT NULL DEFAULT current_timestamp(),
                                                                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0478

```text
canceling statement due to statement timeout
```


### schema_0482

- No isolated invalid CHECK witness for shopping_list_item: 'length(id) = 36'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0490

```text
column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0491

```text
there is no unique constraint matching given keys for referenced table "answer"
```

- No isolated invalid-parent witness for overlapping FK answer.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK answer.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comment.['answer_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comment.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comment.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK comment.['answer_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK question_tag.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK question_tag.['tag_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK question_tag.['question_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK question_tag.['tag_id']; no target-private columns.

### schema_0493

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=227032 DEFAULT CHARSET=latin1...
           ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0494

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0496

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0497

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0503

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 6}

### schema_0505

```text
foreign key constraint "employees_role_id_fkey" cannot be implemented
DETAIL:  Key columns "role_id" of the referencing table and "id" of the referenced table are of incompatible types: character varying and integer.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0506

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0507

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0511

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0512

```text
there is no unique constraint matching given keys for referenced table "archival_institution"
```


### schema_0513

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0518

```text
type "identity" does not exist
LINE 174:     LOG_NR_ identity,
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0521

- Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).
- Normalization blocker: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).
- Failed test categories: {'missing_table': 54}

### schema_0522

```text
syntax error at or near "unsigned"
LINE 4:     "CompanyId" int unsigned NOT NULL auto_increment,
                            ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0527

```text
syntax error at or near "UNSIGNED"
LINE 8:     "fileName" INTEGER UNSIGNED NOT NULL,
                               ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0530

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0532

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0533

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0535

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0536

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0544

```text
type "varbinary" does not exist
LINE 13:     PERMISSIONS VARBINARY,
                         ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0549

```text
syntax error at or near ")"
LINE 15:     "date" date NOT NULL DEFAULT current_timestamp()
                                                            ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0551

```text
type "binary" does not exist
LINE 5:     id BINARY(16) not null,
               ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0552

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 CO...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0555

```text
syntax error at or near "ENGINE"
LINE 69: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0556

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0560

```text
column "shostid1" referenced in foreign key constraint does not exist
```

- Unresolved or ambiguous constraint identifier: 'shostid1'
- Unresolved or ambiguous constraint identifier: 'shostid2'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'shostid1'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'shostid2'

### schema_0566

```text
syntax error at or near "unsigned"
LINE 4:     "coreRequestID" int unsigned NOT NULL AUTO_INCREMENT,
                                ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0567

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```


### schema_0570

```text
syntax error at or near "unsigned"
LINE 38:     "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
                         ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0571

```text
syntax error at or near ""idx_attachment_fulltext""
LINE 21:     FULLTEXT KEY "idx_attachment_fulltext" ("string_content"...
                          ^
```

- No isolated invalid-parent witness for overlapping FK candidate_work_flow_event.['exam_link']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK candidate_work_flow_event.['exam_link']; no target-private columns.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0573

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0575

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0577

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0578

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0580

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0585

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0592

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0593

```text
syntax error at or near "UNSIGNED"
LINE 20:     user_id INT UNSIGNED NOT NULL,
                         ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0597

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0603

```text
syntax error at or near "*"
LINE 147:     DOUBLE_ NUMBER(*,10),
                             ^
```

- Normalization blocker: NUMBER wildcard precision needs an explicit domain policy; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0604

```text
syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0611

```text
type "enum" does not exist
LINE 37:     "trash" enum('0','1') NOT NULL DEFAULT '0',
                     ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0612

- No isolated invalid-parent witness for overlapping FK salaries.['emp_no']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK salaries.['emp_no']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK titles.['emp_no']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK titles.['emp_no']; no target-private columns.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 2}

### schema_0614

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0621

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0624

```text
cannot use column reference in DEFAULT expression
LINE 654:     STATUS CHAR(1) NULL DEFAULT "C",
                                          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0625

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0628

```text
syntax error at or near "UNSIGNED"
LINE 15:     "stock" int UNSIGNED DEFAULT NULL,
                         ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0631

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0633

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0639

```text
column "is_active" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0642

```text
syntax error at or near "BTREE"
LINE 14:     PRIMARY KEY ("id") USING BTREE
                                      ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0648

```text
syntax error at or near "unsigned"
LINE 4:     "aid" int unsigned NOT NULL AUTO_INCREMENT,
                      ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0651

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0652

```text
syntax error at or near "ENGINE"
LINE 25: ) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0654

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0655

```text
syntax error at or near ")"
LINE 9: ..._at" timestamp NOT NULL DEFAULT current_timestamp() ON UPDAT...
                                                             ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0659

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0660

```text
type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0661

```text
type "long" does not exist
LINE 238:     VALUE_ long,
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0672

```text
there is no unique constraint matching given keys for referenced table "user_info"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0673

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 C...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0674

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0676

```text
syntax error at or near "ON"
LINE 10:     "uptime" TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
                                         ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0684

```text
syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLAT...
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0685

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0686

```text
syntax error at or near "IDENTITY"
LINE 172:     LOG_NR_ numeric(19,0) IDENTITY(1,1),
                                    ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0687

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0688

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0694

```text
schema "taxonomy" does not exist
LINE 4: CREATE TABLE taxonomy.high_level
                     ^
```


### schema_0696

```text
column "active" is of type bit but default expression is of type boolean
HINT:  You will need to rewrite or cast the expression.
```

- Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0699

```text
syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0701

```text
relation "vendor" already exists
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0706

```text
type "varchar_ignorecase" does not exist
LINE 28:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0724

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0725

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci...
           ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0734

```text
syntax error at or near "UNSIGNED"
LINE 5:     id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
                      ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0737

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0738

```text
there is no unique constraint matching given keys for referenced table "faculty"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0740

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0742

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Unsupported CHECK expression on 'transactions': 'json_valid(`meta`)' (unsupported CHECK operator)
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0745

```text
there is no unique constraint matching given keys for referenced table "pwm_device"
```


### schema_0751

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0755

```text
syntax error at or near "("
LINE 14:   PRIMARY KEY ("member_id")
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0756

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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

- Normalization blocker: NUMBER wildcard precision needs an explicit domain policy; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0764

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0772

```text
syntax error at or near "ENGINE"
LINE 10: )ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Could not parse ground-truth column: '##为空则没有到，\n\tckst_reason varchar(200) null'
- Normalization blocker: Could not parse ground-truth column: '##为空则没有到，\n\tckst_reason varchar(200) null'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0775

```text
type "varbinary" does not exist
LINE 16:     parameters VARBINARY,
                        ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0777

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0778

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0781

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" bigint UNSIGNED NOT NULL,
                        ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0782

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0784

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0786

```text
syntax error at or near "unsigned"
LINE 5:    region_id int unsigned not null primary key, 
                         ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.

### schema_0788

```text
syntax error at or near "UNSIGNED"
LINE 5:     id int UNSIGNED AUTO_INCREMENT NOT NULL,
                   ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0790

```text
syntax error at or near ")"
LINE 7: ..._at" timestamp NOT NULL DEFAULT current_timestamp() ON UPDAT...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0792

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0796

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0798

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0800

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 14:         LAST_MODIFIED_TIME TIMESTAMP DEFAULT '0000-00-00 00:...
                                                      ^
```


### schema_0802

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE="InnoDB" DEFAULT CHARACTER SET utf8mb4 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0809

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0813

```text
syntax error at or near "ON"
LINE 18: ...ime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                              ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0814

```text
syntax error at or near "LIMIT"
LINE 35: CREATE TABLE LIMIT
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0817

```text
there is no unique constraint matching given keys for referenced table "roles"
```


### schema_0819

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0820

```text
syntax error at or near "CHARACTER"
LINE 5:     "object_type" varchar(1) CHARACTER SET latin1 NOT NULL,
                                     ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0823

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0829

```text
syntax error at or near "CHARACTER"
LINE 5:     "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb...
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0830

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE="InnoDB" DEFAULT CHARACTER SET utf8 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0831

```text
type "enum" does not exist
LINE 29:     title ENUM('Mr', 'Mrs', 'Miss', 'Ms', 'Dr', 'Prof', 'Rev...
                   ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0836

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0837

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0842

```text
type "varchar_ignorecase" does not exist
LINE 6:     group_name varchar_ignorecase(50) not null
                       ^
```


### schema_0843

```text
type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0845

```text
relation "logging_event_id_seq" does not exist
LINE 18:     event_id          INT DEFAULT nextval('logging_event_id_...
                                                   ^
```


### schema_0847

```text
syntax error at or near "unsigned"
LINE 5:     "col_id" int unsigned auto_increment ,
                         ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0849

```text
syntax error at or near ")"
LINE 24: ..."createdTime" timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0858

```text
syntax error at or near "CHARACTER"
LINE 6:     "CategoryName" varchar(255) CHARACTER SET latin1 NOT NUL...
                                        ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0859

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_gene...
          ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0870

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0871

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 4}

### schema_0874

```text
syntax error at or near "*"
LINE 151:     DOUBLE_ NUMBER(*,10),
                             ^
```

- Normalization blocker: NUMBER wildcard precision needs an explicit domain policy; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0876

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0879

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0881

```text
relation "seq_employee_id" does not exist
LINE 5:  employee_id integer NOT NULL DEFAULT nextval('seq_employee_...
                                                      ^
```


### schema_0883

```text
type "enum" does not exist
LINE 23:     "type" ENUM ('MASS', 'VOLUME', 'OTHER') NOT NULL,
                    ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0884

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0889

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0890

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0893

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0899

- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'sec_security': NOT NULL self-referencing/cyclic foreign key ['oid'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'setup_failure': 641, 'wrong_constraint_rejection': 3, 'unexpected_database_error': 2}

### schema_0901_196592

```text
there is no unique constraint matching given keys for referenced table "deck_type"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0902_537610

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0903_641274

```text
syntax error at or near "TYPE"
LINE 142: ) TYPE=INNODB;
            ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0906_691670

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0907_160745

```text
syntax error at or near "UNSIGNED"
LINE 53:     "action_flag" smallint UNSIGNED NOT NULL CHECK ("action_...
                                    ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0908_595029

```text
syntax error at or near "char"
LINE 6:     JOB_NAME VARCHAR(100 char) NOT NULL,
                                 ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0909_091015

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0910_646654

```text
syntax error at or near "engine"
LINE 27: ) engine=MyISAM
           ^
```

- No isolated invalid-parent witness for overlapping FK user_roles.['role_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK user_roles.['role_id']; no target-private columns.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0911_351848

```text
there is no unique constraint matching given keys for referenced table "criteria"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0912_623966

```text
syntax error at or near "UQ_SINGER_1"
LINE 9:     UNIQUE UQ_SINGER_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0917_538663

```text
syntax error at or near "unsigned"
LINE 4:     "action_id" bigint unsigned NOT NULL AUTO_INCREMENT,
                               ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0918_205842

```text
syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0921_180722

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0922_290577

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0923_391323

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0924_372982

```text
syntax error at or near ";"
LINE 25: CREATE TABLE sqlite_stat1(tbl,idx,stat);
                                                ^
```

- Could not determine data type for 'sqlite_stat1.tbl'.
- Could not determine data type for 'sqlite_stat1.idx'.
- Could not determine data type for 'sqlite_stat1.stat'.
- Normalization blocker: Could not determine data type for 'sqlite_stat1.tbl'.
- Normalization blocker: Could not determine data type for 'sqlite_stat1.idx'.
- Normalization blocker: Could not determine data type for 'sqlite_stat1.stat'.

### schema_0925_652965

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0926_444961

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 CO...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0927_432405

```text
syntax error at or near "CHARACTER"
LINE 58:     "events_name" varchar(255) CHARACTER SET utf8 NOT NULL,
                                        ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0928_520831

```text
syntax error at or near "user"
LINE 25:     user TEXT NOT NULL,
             ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0929_108090

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0930_662565

```text
type "varhcar" does not exist
LINE 9:     name VARHCAR(100) NOT NULL
                 ^
```


### schema_0931_468046

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0932_662552

```text
syntax error at or near "ON"
LINE 112: ...te_time" timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                               ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0933_155171

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 1}

### schema_0934_326686

```text
type "enum" does not exist
LINE 12:     "payment_type" enum('DANA','OVO','SPAY','MBANKING') NOT ...
                            ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0940_549205

```text
column "invitation" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0941_659846

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0942_150757

```text
syntax error at or near ")"
LINE 25: ...  "Date-Time" timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0943_664647

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" bigint UNSIGNED NOT NULL,
                        ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0945_570272

```text
type "varchar_ignorecase" does not exist
LINE 7:   sid varchar_ignorecase(100) not null,
              ^
```


### schema_0950_614366

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0952_402169

```text
foreign key constraint "match_Winning_Aircraft_fkey" cannot be implemented
DETAIL:  Key columns "Winning_Aircraft" of the referencing table and "Aircraft_ID" of the referenced table are of incompatible types: text and integer.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0954_100853

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0957_512086

```text
there is no unique constraint matching given keys for referenced table "procedure_in_consultation"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0959_117562

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0960_326291

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0961_403740

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0964_547031

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0966_604469

```text
syntax error at or near "CHARACTER"
LINE 28:     "msgId" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8m...
                                  ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0967_047078

```text
syntax error at or near "unsigned"
LINE 115:     "order_num" int unsigned NOT NULL,
                              ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0968_637990

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0971_260892

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ad` (
                     ^
```

- Normalization blocker: Dollar-quoted/procedural, backslash-escaped or executable-comment SQL requires manual review.

### schema_0972_309020

```text
syntax error at or near "200"
LINE 41: CREATE INDEX ON temp (200);
                               ^
```

- Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Unresolved or ambiguous constraint identifier: 'ad_locales'
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Could not synthesize a parent row in 'apm_package_types' for the FK-accept test on 'lang_message_keys'.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Could not synthesize a parent row in 'ad_locales' for the FK-accept test on 'lang_messages'.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; using a best-effort dummy value.
- Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; using a best-effort dummy value.
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'ad_locales'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0973_254233

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0974_336891

```text
syntax error at or near "unsigned"
LINE 5:     "id" int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0975_324672

```text
there is no unique constraint matching given keys for referenced table "artist"
```


### schema_0976_390037

```text
there is no unique constraint matching given keys for referenced table "log"
```


### schema_0977_609312

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0978_482243

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0983_295376

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0984_334739

- No isolated invalid-parent witness for overlapping FK plot_checks.['lab_id']; no target-private columns.

### schema_0987_242178

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0989_143776

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0990_174588

```text
type "enum" does not exist
LINE 65:     type ENUM('permanenttransfers', 'playerexchangetransfers...
                  ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0991_336216

```text
relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
```


### schema_0993_348884

```text
type "varchar_ignorecase" does not exist
LINE 28:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0994_684903

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0995_401888

```text
type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0996_541548

```text
type "year" does not exist
LINE 22:     "graduation_year" year(4) NOT NULL
                               ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0999_062302

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1000_617352

```text
syntax error at or near ""alert_send_all""
LINE 26:     UNIQUE "alert_send_all" ("layout_id", "alert_id", "curre...
                    ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1002_179110

```text
type "bin" does not exist
LINE 17:     att_bin bin(10)
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1004_219344

```text
syntax error at or near "ALTER"
LINE 31: ALTER TABLE roles_users ADD CONSTRAINT roles_fk FOREIGN KEY ...
         ^
```

- No isolated invalid-parent witness for overlapping FK roles_users.['user_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK roles_users.['user_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK roles_users.['user_id']; no target-private columns.

### schema_1005_570602

```text
syntax error at or near "("
LINE 82: ALTER TABLE departments ADD ( CONSTRAINT dept_mgr_fk FOREIGN...
                                     ^
```

- Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1008_176453

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1009_358090

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1010_080239

```text
there is no unique constraint matching given keys for referenced table "document_master"
```


### schema_1011_386375

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1012_059331

```text
syntax error at or near ","
LINE 9:     PREVAILING_WAGE FLOAT(10,2) NOT NULL,
                                    ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1013_441410

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1014_183534

```text
syntax error at or near ""alert_send_all""
LINE 27:     UNIQUE "alert_send_all" ("layout_id", "alert_id", "curre...
                    ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1015_545494

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1020_184540

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1021_493175

```text
syntax error at or near "on"
LINE 26:     last_updated_at TIMESTAMP on update current_timestamp
                                       ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1022_393548

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1023_473037

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1025_400667

```text
foreign key constraint "advdata_gatewayseqno_fkey" cannot be implemented
DETAIL:  Key columns "gatewayseqno" of the referencing table and "gatewayseqno" of the referenced table are of incompatible types: character varying and integer.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1027_665032

```text
constraint "fixture_id_fk" for relation "motion_packets" already exists
```

- No isolated invalid-parent witness for overlapping FK motion_packets.['fixture_id']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK motion_packets.['fixture_id']; no target-private columns.

### schema_1029_554720

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1030_245326

```text
syntax error at or near "UNSIGNED"
LINE 6:     roleId INT UNSIGNED NOT NULL,
                       ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1031_610804

```text
syntax error at or near "ENGINE"
LINE 343: ) ENGINE=innodb AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
            ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1032_033274

```text
there is no unique constraint matching given keys for referenced table "customers"
```

- Unresolved or ambiguous constraint identifier: 'products_id'
- Unresolved or ambiguous constraint identifier: 'orders_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'products_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'orders_id'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1033_362362

```text
syntax error at or near "UQ_CONTACT_1"
LINE 8:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1034_531024

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1035_417385

```text
type "badge" does not exist
LINE 28:     badge badge DEFAULT 'none'::badge,
                   ^
```


### schema_1036_289819

```text
cannot use column reference in DEFAULT expression
LINE 48:     stato varchar(20) NOT NULL DEFAULT "In attesa",
                                                ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1037_521203

```text
syntax error at or near "UNSIGNED"
LINE 6:     "user_id" int UNSIGNED NOT NULL,
                          ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1041_644261

```text
type "varchar_ignorecase" does not exist
LINE 28:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1042_624410

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1043_118618

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1044_019860

```text
syntax error at or near "unsigned"
LINE 4:     "cat_id" int unsigned NOT NULL AUTO_INCREMENT,
                         ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1046_287891

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1047_207965

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1051_259055

```text
type "varbinary" does not exist
LINE 16:     parameters VARBINARY,
                        ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1053_675929

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1055_080731

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1059_346369

```text
syntax error at or near "same"
LINE 4: CREATE TABLE statements same as in Figure 5.1b  */
                                ^
```


### schema_1061_295385

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1063_000018

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1068_491851

```text
syntax error at or near "CHARACTER"
LINE 6:     "name" varchar(40) CHARACTER SET utf8 COLLATE utf8_gener...
                               ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1070_336136

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1072_659835

```text
syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1073_314345

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE="InnoDB" DEFAULT CHARACTER SET utf8 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1074_270875

```text
syntax error at or near ")"
LINE 83: ...ime" timestamp NOT NULL DEFAULT current_timestamp() ON UPDAT...
                                                              ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1075_084716

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1077_338588

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1078_600014

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE="InnoDB" DEFAULT CHARACTER SET utf8mb4 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1079_213377

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1080_520449

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1081_289414

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1082_167670

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1083_674851

```text
there is no unique constraint matching given keys for referenced table "users"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1084_417202

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1086_656955

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1087_556070

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_genera...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1088_326764

```text
syntax error at or near "UNSIGNED"
LINE 4:     id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                   ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1091_085280

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 32:     "CREATION_DATE" TIMESTAMP NOT NULL default '0000-00-00 0...
                                                        ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1092_364010

```text
syntax error at or near "ENGINE"
LINE 233: )ENGINE=InnoDB DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1096_483661

```text
syntax error at or near "CHARACTER"
LINE 5:     "name" varchar(80) CHARACTER SET utf8 COLLATE utf8_gener...
                               ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1097_348151

```text
syntax error at or near "TYPE"
LINE 8: ) TYPE=InnoDB;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1099_654747

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1100_299606

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1101_650753

- No isolated invalid-parent witness for overlapping FK Earned.['BadgeID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Earned.['UserID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Earned.['UserID']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Earned.['BadgeID']; no target-private columns.

### schema_1102_682811

```text
syntax error at or near "*"
LINE 151:     DOUBLE_ NUMBER(*,10),
                             ^
```

- Normalization blocker: NUMBER wildcard precision needs an explicit domain policy; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1103_115675

```text
syntax error at or near "key"
LINE 24:     email_id varchar(50) not null unique key,
                                                  ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1105_583941

```text
syntax error at or near "("
LINE 463:   PRIMARY KEY (ID)
                        ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1108_251945

```text
relation "driver" already exists
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1109_387896

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1110_493927

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1111_287457

```text
there is no unique constraint matching given keys for referenced table "languages"
```


### schema_1112_007491

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 2}

### schema_1116_107207

```text
syntax error at or near "USING"
LINE 8:     KEY "st_idx" ("st") USING HASH
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1117_622224

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1118_276995

```text
there is no unique constraint matching given keys for referenced table "email"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1120_301595

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1122_217285

```text
syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1123_278484

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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
syntax error at or near "ENGINE"
LINE 56: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1132_005273

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1133_264586

```text
syntax error at or near "USING"
LINE 8:     KEY "st_idx" ("st") USING HASH
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1137_334854

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1138_419494

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1139_103727

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1142_235666

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1145_561835

```text
type "test29_master_depend" does not exist
LINE 11:     index test29_master_depend ( depend1_id ),
                   ^
```


### schema_1146_454496

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1148_575663

```text
there is no unique constraint matching given keys for referenced table "person"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1150_217837

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1151_048516

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1152_259631

```text
relation "act_ru_variable" does not exist
```

- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1154_693691

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1155_119431

```text
syntax error at or near "USING"
LINE 8:     KEY "st_idx" ("st") USING HASH
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1157_113711

```text
there is no unique constraint matching given keys for referenced table "user"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1158_367517

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1160_679413

```text
syntax error at or near "CHAR"
LINE 4:     Physician_Profile_ID VARCHAR(38 CHAR),
                                            ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1161_297667

```text
syntax error at or near "ASC"
LINE 18:     INDEX fk_hospital_adress1_idx (adress_id ASC) VISIBLE,
                                                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1162_166427

```text
type "year" does not exist
LINE 8:     Year YEAR,
                 ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1163_147317

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1165_522626

```text
type "longvarchar" does not exist
LINE 64:     SERIALIZED_CONTEXT LONGVARCHAR,
                                ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1166_118993

```text
syntax error at or near "UNSIGNED"
LINE 5:     "administrator_id" bigint UNSIGNED NOT NULL,
                                      ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1169_027702

```text
syntax error at or near ")"
LINE 58:     Entry timestamp default(current_timestamp())
                                                       ^
```

- Could not parse a CREATE TABLE definition.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Unsupported ALTER TABLE constraint: 'drop foreign key products_ibfk_1'
- Unresolved or ambiguous constraint identifier: 'studentid'
- Normalization blocker: Could not parse a CREATE TABLE definition.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'drop foreign key products_ibfk_1'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'studentid'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1172_394848

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1173_307431

- Unsupported CHECK expression on 'Staff': "staffEmail Like '%@%'" (unsupported CHECK operator)
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'setup_failure': 25, 'wrong_constraint_rejection': 2}

### schema_1174_475536

```text
syntax error at or near "ON"
LINE 58: ...amp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                              ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1175_025608

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1176_594644

```text
there is no unique constraint matching given keys for referenced table "team"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1177_433889

```text
there is no unique constraint matching given keys for referenced table "city"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1178_485121

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1179_497840

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1182_162164

```text
type "double" does not exist
LINE 23:     "saldo" double(16,2) DEFAULT NULL,
                     ^
```

- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1183_499639

```text
syntax error at or near "engine"
LINE 12: )engine=InnoDB;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1184_316974

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1187_124428

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1189_344012

```text
there is no unique constraint matching given keys for referenced table "users"
```


### schema_1190_414439

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```


### schema_1192_006290

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1193_607463

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1195_063455

```text
type "varbinary" does not exist
LINE 15:     BYTES_ varbinary(max),
                    ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1196_356982

```text
there is no unique constraint matching given keys for referenced table "fire_station_information"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1197_304772

```text
syntax error at or near ""attribute_values_attributes_id_value""
LINE 30:     UNIQUE "attribute_values_attributes_id_value" ("attribut...
                    ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1198_283986

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1199_239178

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1201_239756

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1202_625711

```text
syntax error at or near "CHARACTER"
LINE 5:     "author" varchar(40) CHARACTER SET utf8 COLLATE utf8_gen...
                                 ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1205_030960

```text
column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1207_239489

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1214_130697

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1216_629322

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1219_660727

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1220_019171

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1221_233519

```text
column "magv" referenced in foreign key constraint does not exist
```

- Unresolved or ambiguous constraint identifier: 'MaGV'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'MaGV'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1222_039356

```text
syntax error at or near "user"
LINE 34:                           user varchar(255) not null,
                                   ^
```


### schema_1223_109688

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" bigint UNSIGNED NOT NULL,
                        ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1224_512880

- Unsupported CHECK expression on 'Employees': "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'" (unsupported CHECK operator)
- Unsupported CHECK expression on 'Departments': "id LIKE '[0-9][0-9][0-9]'" (unsupported CHECK operator)
- Failed test categories: {'setup_failure': 14, 'wrong_constraint_rejection': 2}

### schema_1226_202671

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1227_189095

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1228_038090

```text
there is no unique constraint matching given keys for referenced table "users"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1229_458061

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 CO...
          ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1231_368533

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1232_658129

```text
syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1237_355236

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1238_617427

```text
syntax error at or near "ENGINE"
LINE 18: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
```

- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- table 'Employee': NOT NULL self-referencing/cyclic foreign key ['reportTo'] could not be safely resolved to a real parent; using a best-effort dummy value that may itself violate the FK constraint.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1239_638548

```text
type "varchar_ignorecase" does not exist
LINE 28:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1240_300469

```text
function curdate() does not exist
LINE 65:     "datedebon" date         NOT NULL DEFAULT curdate(),
                                                       ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1241_258878

```text
syntax error at or near "UNSIGNED"
LINE 5:     "id" int UNSIGNED NOT NULL,
                     ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1242_249341

```text
syntax error at or near "unsigned"
LINE 4:     "action_id" int unsigned NOT NULL AUTO_INCREMENT,
                            ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1243_421581

```text
column "verified" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```


### schema_1245_589116

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1247_508785

```text
type "longvarchar" does not exist
LINE 64:     SERIALIZED_CONTEXT LONGVARCHAR,
                                ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1251_354516

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1252_307603

```text
syntax error at or near "UNSIGNED"
LINE 4:     "id" bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                        ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1254_666807

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1256_060874

```text
type "long" does not exist
LINE 8: PHONE LONG, 
              ^
```


### schema_1257_194099

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1259_435992

```text
type "identity" does not exist
LINE 174:     LOG_NR_ identity,
                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1260_590060

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1262_604319

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1264_630818

```text
syntax error at or near "ENGINE"
LINE 29: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1265_471935

```text
column "BUSINESS_KEY_" does not exist
LINE 42: ...r (255)  not null  generated always as (case when "BUSINESS_...
                                                              ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1268_420590

```text
syntax error at or near "unsigned"
LINE 4:     "uid" int unsigned NOT NULL AUTO_INCREMENT,
                      ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1269_326189

```text
syntax error at or near "USING"
LINE 8:     KEY "st_idx" ("st") USING HASH
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1270_099383

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1272_534240

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1273_587363

```text
syntax error at or near "#"
LINE 5:     # 用户ID
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
- Normalization blocker: Could not parse ground-truth column: '# 用户ID\n\tuserID varchar(10)'
- Normalization blocker: Could not parse ground-truth column: '# varchar \n\t# 用户名\n\tuserName VARCHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 登录密码\n\tuserPassword VARCHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (userID)'
- Normalization blocker: Could not parse ground-truth column: '# 工号\n\twaiterID varchar(10)'
- Normalization blocker: Could not parse ground-truth column: '#varchar\n\t# 姓名\n\twaiterName VARCHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 出生日期\n\twaiterBirthday DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 身份证\n\twaiterIDCard CHAR(18) NOT NULL UNIQUE'
- Normalization blocker: Could not parse ground-truth column: '# 系统登录密码\n\twaiterPassword VARCHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 入职日期\n\twaiterJoinDate DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 手机\n\twaiterPhoneNumber CHAR(11) UNIQUE'
- Normalization blocker: Could not parse ground-truth column: '# 备注\n\tremarks VARCHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (waiterID)'
- Normalization blocker: Could not parse ground-truth column: '# 会员等级（主码）\n\tlevel smallint'
- Normalization blocker: Could not parse ground-truth column: '# smallint  LV 1-10\n\t# 享受折扣\n\tdiscount decimal(10,2) unsigned'
- Normalization blocker: Could not parse ground-truth column: '# 等级对应消费金额\n\ttotalAmount bigint'
- Normalization blocker: Could not parse ground-truth column: '# bigint\n\t# 备注\n\tremarks VARCHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (level)'
- Normalization blocker: Could not parse ground-truth column: '# 房间类型（主码）\n\troomType VARCHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 价格\n\tprice INT UNSIGNED NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (roomType)'
- Normalization blocker: Could not parse ground-truth column: '# 顾客身份证\n\tcustomerIDCard CHAR(18)'
- Normalization blocker: Could not parse ground-truth column: "# 性别\n\tcustomerGender CHAR(4) check (customerGender ='男' or customerGender='女')"
- Normalization blocker: Could not parse ground-truth column: '# 限制 男或女  \n\t# 姓名\n\tcustomerName VARCHAR(16) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 出生日期\n\tcustomerBirthday DATE'
- Normalization blocker: Could not parse ground-truth column: '# 会员等级\n\tcustomerVIPLevel smallint'
- Normalization blocker: Could not parse ground-truth column: '# 改成 smallint \n\t# 手机号码\n\tcustomerPhoneNumber CHAR(11)'
- Normalization blocker: Could not parse ground-truth column: '# 消费金额\n\ttotalAmount INT UNSIGNED'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (customerIDCard)'
- Normalization blocker: Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (customerVIPLevel) REFERENCES VIPLevel(level)'
- Normalization blocker: Could not parse ground-truth column: '# 房间号（主码）\n\troomNumber CHAR(6)'
- Normalization blocker: Could not parse ground-truth column: '# 房间类型\n\troomType VARCHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: "# 状态\n\troomStatus CHAR(6) check (roomStatus='空' or roomStatus='非空')"
- Normalization blocker: Could not parse ground-truth column: '# 空/非空 \n\t# 备注\n\tremarks VARCHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (roomNumber)'
- Normalization blocker: Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (roomType) REFERENCES roomTypeAndPrice(roomType)'
- Normalization blocker: Could not parse ground-truth column: '# 订单号\n\torderNumber CHAR(32) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: "# 订单状态\n\torderStatus CHAR(18) check (value in ('预订中','已入住','已退房'))"
- Normalization blocker: Could not parse ground-truth column: '# 客户身份证\n\tcustomerIDCard CHAR(18)'
- Normalization blocker: Could not parse ground-truth column: '# 入住房间号\n\troomNumber CHAR(6) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 入住时间\n\tcheckInTime DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 离店时间\n\tcheckOutTime DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 需付金额(由于可能续费，不能作为外键)\n\ttotalMoney INT UNSIGNED NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 服务员工号\n\twaiterID VARCHAR(10) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (orderNumber)'
- Normalization blocker: Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (customerIDCard) REFERENCES customers(customerIDCard)'
- Normalization blocker: Could not parse ground-truth column: '# 订单号\n\torderNumber CHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 预定时间（订单表中一旦有预定订单加入，那么本表新增一条记录，本字段不可能为空）\n\torderTime DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 实际入住时间\n\tcheckInTime DATE'
- Normalization blocker: Could not parse ground-truth column: '# 实际退房时间\n\tcheckOutTime DATE'
- Normalization blocker: Could not parse ground-truth column: '# 同时作为外键\n\tFOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)'
- Normalization blocker: Could not parse ground-truth column: '# 操作记录号\n\toperatingID INT UNSIGNED AUTO_INCREMENT'
- Normalization blocker: Could not parse ground-truth column: '# 操作的订单号(是记录中的订单号，外码，参照订单表)\n\torderNumber CHAR(32)'
- Normalization blocker: Could not parse ground-truth column: '# 住房原到期日期\n\toldExpiryDate DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 住房新到期日期\n\tnewExpiryDate DATE NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 需要添加的金额\n\taddedMoney INT UNSIGNED NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '# 主键\n\tPRIMARY KEY (operatingID)'
- Normalization blocker: Could not parse ground-truth column: '# 外键\n\tFOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'roomNumber'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'waiterID'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1275_254209

```text
there is no unique constraint matching given keys for referenced table "ref_biz_data_inst"
```


### schema_1276_694753

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1279_031575

```text
syntax error at or near "("
LINE 462:   PRIMARY KEY (ID)
                        ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1282_521421

```text
there is no unique constraint matching given keys for referenced table "tbls"
```


### schema_1283_332944

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1285_375298

```text
syntax error at or near "CHARACTER"
LINE 7:     "img" varchar(64) CHARACTER SET utf8 COLLATE utf8_genera...
                              ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1287_022562

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1289_203345

```text
type "varchar2" does not exist
LINE 5:     key varchar2(1024) NOT NULL,
                ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1290_211978

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1292_596003

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 CO...
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1293_031816

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1295_618406

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1296_538462

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1297_191052

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1298_324181

```text
syntax error at or near "unsigned"
LINE 5:     "maintenanceid" bigint unsigned                         ...
                                   ^
```

- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1299_234701

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1300_274091

```text
relation "xxx" already exists
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unresolved or ambiguous constraint identifier: 'a'
- Unsupported CHECK expression on 'tab2': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'tab3': 'c2-c3<80' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_4': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_5': 'c2-c3<80' (unsupported CHECK token)
- Unsupported CHECK expression on 'atdc_1_constraints': 'c is not null' (unsupported CHECK operator)
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'a'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1301_448226

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1303_061998

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1304_492215

```text
syntax error at or near "UNSIGNED"
LINE 5:     id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1305_484289

```text
syntax error at or near ")"
LINE 28: ...publish_date" timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1307_441345

```text
there is no unique constraint matching given keys for referenced table "filiere"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1308_267996

```text
syntax error at or near "FOREIGN"
LINE 86: ALTER TABLE Teaches DROP FOREIGN KEY FKTeaches_teacherId;
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
- No isolated invalid-parent witness for overlapping FK Teaches.['teacherId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Teaches.['sectionId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Teaches.['teacherId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Teaches.['sectionId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Teaches.['sectionId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Teaches.['teacherId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Takes.['studentId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Takes.['studentId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Takes.['studentId']; no target-private columns.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_teacherId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTakes_studentId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP major'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP dept'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP title'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP number'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP numUnits'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_deptId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP deptId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'ADD COLUMN coordId INT NULL'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKTeaches_sectionId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_courseId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP courseId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKCourse_coordId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKCourse_deptId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'deptId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'courseId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'majorId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'coordId'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1309_516625

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1312_441794

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1313_266228

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1315_574283

- Unsupported CHECK expression on 'series': 'pays is not null' (unsupported CHECK operator)
- Unsupported CHECK expression on 'series': 'dateS is not null' (unsupported CHECK operator)
- Unsupported CHECK expression on 'utilisateur': 'dateI is not null' (unsupported CHECK operator)
- Unsupported CHECK expression on 'episode': 'datedif is not null' (unsupported CHECK operator)
- Unsupported CHECK expression on 'staff': 'nom is not null' (unsupported CHECK operator)
- Unsupported CHECK expression on 'staff': 'prenom is not null' (unsupported CHECK operator)
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'unexpected_database_error': 1}

### schema_1317_514500

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1318_239002

```text
syntax error at or near ")"
LINE 36:     date TIMESTAMP NOT NULL DEFAULT current_timestamp()
                                                               ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1319_042917

```text
syntax error at or near "ALTER"
LINE 31: ALTER TABLE user_role
         ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

