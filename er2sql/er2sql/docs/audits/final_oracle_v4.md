# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 267/618.

DDL compiles: 274; all finite execution checks pass: 273; technical checks without warnings/blockers pass: 267; conversion review missing: 326.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0164 | False | 0/74 | 8 | False |
| schema_0169 | True | 33/33 | 0 | True |
| schema_0173 | False | 0/37 | 1 | False |
| schema_0177 | True | 22/22 | 0 | True |
| schema_0178 | True | 422/422 | 0 | True |
| schema_0179 | True | 26/26 | 0 | True |
| schema_0181 | False | 0/112 | 2 | False |
| schema_0183 | False | 0/39 | 3 | False |
| schema_0184 | False | 0/91 | 1 | False |
| schema_0185 | False | 0/139 | 2 | False |
| schema_0186 | True | 135/135 | 0 | True |
| schema_0190 | True | 24/24 | 0 | True |
| schema_0191 | False | 0/530 | 1 | False |
| schema_0193 | False | 0/105 | 1 | False |
| schema_0195 | False | 0/287 | 1 | False |
| schema_0196 | False | 0/719 | 1 | False |
| schema_0197 | True | 32/32 | 0 | True |
| schema_0198 | True | 126/126 | 0 | True |
| schema_0200 | True | 104/104 | 0 | True |
| schema_0204 | False | 0/219 | 1 | False |
| schema_0207 | False | 0/62 | 7 | False |
| schema_0208 | False | 0/57 | 1 | False |
| schema_0210 | False | 0/405 | 3 | False |
| schema_0217 | False | 0/67 | 1 | False |
| schema_0218 | True | 81/81 | 0 | True |
| schema_0219 | False | 0/31 | 1 | False |
| schema_0220 | False | 0/46 | 1 | False |
| schema_0221 | True | 76/76 | 0 | True |
| schema_0223 | True | 127/127 | 0 | True |
| schema_0225 | False | 0/104 | 1 | False |
| schema_0226 | True | 99/99 | 0 | True |
| schema_0228 | True | 188/188 | 0 | True |
| schema_0229 | False | 0/219 | 1 | False |
| schema_0230 | False | 0/62 | 1 | False |
| schema_0231 | True | 70/70 | 0 | True |
| schema_0238 | False | 0/60 | 1 | False |
| schema_0240 | True | 34/34 | 0 | True |
| schema_0244 | True | 135/135 | 0 | True |
| schema_0247 | False | 0/117 | 6 | False |
| schema_0248 | True | 135/135 | 0 | True |
| schema_0255 | False | 0/36 | 1 | False |
| schema_0258 | True | 82/82 | 0 | True |
| schema_0264 | True | 32/32 | 0 | True |
| schema_0266 | False | 0/203 | 1 | False |
| schema_0267 | False | 0/151 | 1 | False |
| schema_0269 | False | 0/226 | 3 | False |
| schema_0272 | False | 0/211 | 1 | False |
| schema_0273 | False | 0/430 | 1 | False |
| schema_0274 | True | 83/83 | 0 | True |
| schema_0275 | False | 0/40 | 1 | False |
| schema_0277 | False | 0/92 | 1 | False |
| schema_0279 | False | 0/318 | 6 | False |
| schema_0280 | False | 0/67 | 1 | False |
| schema_0281 | False | 0/165 | 1 | False |
| schema_0282 | True | 33/33 | 0 | True |
| schema_0284 | False | 0/18 | 1 | False |
| schema_0285 | False | 0/33 | 1 | False |
| schema_0286 | True | 76/76 | 0 | True |
| schema_0288 | True | 87/87 | 0 | True |
| schema_0289 | True | 73/73 | 0 | True |
| schema_0290 | False | 0/857 | 1 | False |
| schema_0292 | False | 0/278 | 1 | False |
| schema_0293 | False | 0/144 | 1 | False |
| schema_0294 | True | 26/26 | 0 | True |
| schema_0297 | True | 70/70 | 0 | True |
| schema_0300 | True | 25/25 | 0 | True |
| schema_0302 | True | 76/76 | 0 | True |
| schema_0310 | True | 46/46 | 0 | True |
| schema_0311 | True | 51/51 | 0 | True |
| schema_0314 | True | 36/36 | 0 | True |
| schema_0317 | True | 62/62 | 0 | True |
| schema_0320 | False | 0/462 | 1 | False |
| schema_0325 | True | 61/61 | 0 | True |
| schema_0327 | False | 0/23 | 0 | False |
| schema_0328 | False | 0/157 | 1 | False |
| schema_0329 | False | 0/183 | 1 | False |
| schema_0332 | False | 0/61 | 1 | False |
| schema_0333 | True | 94/94 | 0 | True |
| schema_0335 | True | 23/23 | 0 | True |
| schema_0338 | False | 0/142 | 1 | False |
| schema_0339 | False | 0/158 | 1 | False |
| schema_0343 | False | 0/127 | 1 | False |
| schema_0345 | True | 127/127 | 0 | True |
| schema_0348 | False | 0/523 | 1 | False |
| schema_0349 | False | 0/33 | 1 | False |
| schema_0353 | False | 0/938 | 1 | False |
| schema_0360 | True | 54/54 | 0 | True |
| schema_0366 | False | 0/98 | 1 | False |
| schema_0367 | False | 0/73 | 9 | False |
| schema_0368 | False | 0/52 | 1 | False |
| schema_0369 | True | 20/20 | 0 | True |
| schema_0371 | False | 0/216 | 2 | False |
| schema_0372 | False | 0/80 | 1 | False |
| schema_0375 | False | 0/253 | 1 | False |
| schema_0376 | False | 0/102 | 1 | False |
| schema_0377 | False | 0/219 | 1 | False |
| schema_0378 | True | 54/54 | 0 | True |
| schema_0381 | True | 36/36 | 0 | True |
| schema_0383 | True | 136/136 | 0 | True |
| schema_0384 | False | 0/54 | 0 | False |
| schema_0386 | True | 19/19 | 0 | True |
| schema_0390 | True | 87/87 | 0 | True |
| schema_0391 | True | 44/44 | 0 | True |
| schema_0392 | False | 0/75 | 1 | False |
| schema_0393 | False | 0/40 | 1 | False |
| schema_0398 | False | 0/105 | 1 | False |
| schema_0400 | False | 0/48 | 1 | False |
| schema_0402 | False | 0/30 | 1 | False |
| schema_0403 | False | 0/119 | 1 | False |
| schema_0405 | False | 0/118 | 1 | False |
| schema_0406 | False | 0/570 | 2 | False |
| schema_0409 | False | 0/456 | 12 | False |
| schema_0414 | True | 47/47 | 0 | True |
| schema_0415 | False | 0/91 | 9 | False |
| schema_0419 | True | 32/32 | 0 | True |
| schema_0420 | True | 46/46 | 0 | True |
| schema_0424 | True | 33/33 | 0 | True |
| schema_0425 | True | 135/135 | 0 | True |
| schema_0431 | True | 132/132 | 0 | True |
| schema_0434 | False | 0/578 | 1 | False |
| schema_0436 | False | 0/150 | 1 | False |
| schema_0438 | False | 0/52 | 0 | False |
| schema_0440 | False | 0/130 | 1 | False |
| schema_0443 | False | 0/62 | 1 | False |
| schema_0444 | True | 50/50 | 0 | True |
| schema_0446 | True | 78/78 | 0 | True |
| schema_0449 | False | 0/45 | 1 | False |
| schema_0454 | False | 0/432 | 1 | False |
| schema_0456 | True | 246/246 | 0 | True |
| schema_0457 | True | 37/37 | 0 | True |
| schema_0459 | True | 50/50 | 0 | True |
| schema_0464 | True | 135/135 | 0 | True |
| schema_0465 | False | 0/91 | 0 | False |
| schema_0468 | True | 30/30 | 0 | True |
| schema_0469 | False | 0/149 | 1 | False |
| schema_0470 | False | 0/124 | 1 | False |
| schema_0471 | False | 0/218 | 1 | False |
| schema_0478 | True | 76/76 | 0 | True |
| schema_0481 | True | 25/25 | 0 | True |
| schema_0482 | True | 94/94 | 0 | True |
| schema_0490 | False | 0/179 | 1 | False |
| schema_0491 | False | 0/49 | 11 | False |
| schema_0493 | False | 0/486 | 1 | False |
| schema_0494 | True | 37/37 | 0 | True |
| schema_0496 | True | 45/45 | 0 | True |
| schema_0497 | True | 24/24 | 0 | True |
| schema_0499 | True | 42/42 | 0 | True |
| schema_0503 | True | 525/525 | 0 | True |
| schema_0505 | False | 0/26 | 1 | False |
| schema_0506 | True | 87/87 | 0 | True |
| schema_0507 | False | 0/239 | 1 | False |
| schema_0511 | False | 0/136 | 1 | False |
| schema_0512 | False | 0/459 | 1 | False |
| schema_0513 | True | 172/172 | 0 | True |
| schema_0516 | True | 128/128 | 0 | True |
| schema_0518 | False | 0/217 | 1 | False |
| schema_0521 | True | 54/54 | 2 | False |
| schema_0522 | True | 223/223 | 0 | True |
| schema_0527 | False | 0/278 | 1 | False |
| schema_0530 | False | 0/116 | 1 | False |
| schema_0532 | True | 87/87 | 0 | True |
| schema_0533 | True | 27/27 | 0 | True |
| schema_0535 | False | 0/293 | 1 | False |
| schema_0536 | True | 36/36 | 0 | True |
| schema_0544 | True | 418/418 | 0 | True |
| schema_0549 | False | 0/89 | 1 | False |
| schema_0551 | False | 0/200 | 1 | False |
| schema_0552 | False | 0/45 | 1 | False |
| schema_0555 | False | 0/212 | 1 | False |
| schema_0556 | True | 34/34 | 0 | True |
| schema_0560 | False | 0/552 | 4 | False |
| schema_0563 | True | 48/48 | 0 | True |
| schema_0566 | False | 0/98 | 1 | False |
| schema_0567 | False | 0/177 | 1 | False |
| schema_0570 | False | 0/481 | 1 | False |
| schema_0571 | False | 0/566 | 3 | False |
| schema_0573 | True | 135/135 | 0 | True |
| schema_0575 | True | 124/124 | 0 | True |
| schema_0577 | True | 32/32 | 0 | True |
| schema_0578 | False | 0/525 | 1 | False |
| schema_0580 | True | 49/49 | 0 | True |
| schema_0581 | True | 52/52 | 0 | True |
| schema_0585 | True | 157/157 | 0 | True |
| schema_0591 | False | 0/67 | 1 | False |
| schema_0592 | True | 201/201 | 0 | True |
| schema_0593 | False | 0/208 | 1 | False |
| schema_0597 | False | 0/87 | 1 | False |
| schema_0600 | True | 54/54 | 0 | True |
| schema_0603 | True | 202/202 | 0 | True |
| schema_0604 | False | 0/187 | 1 | False |
| schema_0611 | False | 0/73 | 1 | False |
| schema_0612 | True | 68/68 | 3 | False |
| schema_0614 | False | 0/64 | 1 | False |
| schema_0617 | True | 31/31 | 0 | True |
| schema_0620 | False | 0/28 | 1 | False |
| schema_0621 | True | 44/44 | 0 | True |
| schema_0624 | False | 0/624 | 1 | False |
| schema_0625 | False | 0/305 | 1 | False |
| schema_0627 | True | 25/25 | 0 | True |
| schema_0628 | True | 51/51 | 0 | True |
| schema_0631 | True | 19/19 | 0 | True |
| schema_0633 | True | 135/135 | 0 | True |
| schema_0635 | True | 65/65 | 0 | True |
| schema_0639 | False | 0/64 | 1 | False |
| schema_0642 | False | 0/107 | 1 | False |
| schema_0648 | False | 0/117 | 1 | False |
| schema_0649 | True | 74/74 | 0 | True |
| schema_0651 | True | 392/392 | 0 | True |
| schema_0652 | False | 0/299 | 1 | False |
| schema_0654 | True | 127/127 | 0 | True |
| schema_0655 | False | 0/396 | 1 | False |
| schema_0659 | True | 27/27 | 0 | True |
| schema_0660 | False | 0/208 | 1 | False |
| schema_0661 | False | 0/828 | 1 | False |
| schema_0665 | True | 41/41 | 0 | True |
| schema_0672 | False | 0/63 | 1 | False |
| schema_0673 | False | 0/97 | 1 | False |
| schema_0674 | True | 32/32 | 0 | True |
| schema_0676 | False | 0/68 | 1 | False |
| schema_0678 | True | 32/32 | 0 | True |
| schema_0681 | True | 43/43 | 0 | True |
| schema_0684 | False | 0/336 | 1 | False |
| schema_0685 | True | 35/35 | 0 | True |
| schema_0686 | False | 0/203 | 2 | False |
| schema_0687 | True | 76/76 | 0 | True |
| schema_0688 | True | 32/32 | 0 | True |
| schema_0694 | False | 0/99 | 1 | False |
| schema_0696 | False | 0/278 | 3 | False |
| schema_0699 | False | 0/101 | 1 | False |
| schema_0701 | False | 0/134 | 1 | False |
| schema_0702 | False | 0/188 | 1 | False |
| schema_0704 | True | 129/129 | 0 | True |
| schema_0706 | False | 0/52 | 1 | False |
| schema_0724 | True | 33/33 | 0 | True |
| schema_0725 | False | 0/29 | 1 | False |
| schema_0727 | False | 0/104 | 0 | False |
| schema_0728 | True | 49/49 | 0 | True |
| schema_0731 | False | 0/79 | 0 | False |
| schema_0732 | False | 0/115 | 1 | False |
| schema_0733 | True | 48/48 | 0 | True |
| schema_0734 | False | 0/27 | 1 | False |
| schema_0737 | False | 0/102 | 1 | False |
| schema_0738 | False | 0/101 | 1 | False |
| schema_0740 | False | 0/462 | 1 | False |
| schema_0742 | False | 0/749 | 2 | False |
| schema_0745 | False | 0/283 | 1 | False |
| schema_0751 | True | 34/34 | 0 | True |
| schema_0755 | False | 0/104 | 1 | False |
| schema_0756 | True | 140/140 | 0 | True |
| schema_0761 | False | 0/209 | 1 | False |
| schema_0762 | True | 361/361 | 0 | True |
| schema_0764 | False | 0/70 | 1 | False |
| schema_0772 | False | 0/180 | 1 | False |
| schema_0775 | True | 55/55 | 0 | True |
| schema_0777 | True | 76/76 | 0 | True |
| schema_0778 | False | 0/37 | 1 | False |
| schema_0781 | False | 0/190 | 1 | False |
| schema_0782 | True | 30/30 | 0 | True |
| schema_0784 | True | 45/45 | 0 | True |
| schema_0786 | True | 84/84 | 0 | True |
| schema_0788 | True | 352/352 | 0 | True |
| schema_0790 | False | 0/123 | 1 | False |
| schema_0792 | True | 135/135 | 0 | True |
| schema_0793 | True | 188/188 | 0 | True |
| schema_0795 | True | 65/65 | 0 | True |
| schema_0796 | False | 0/79 | 1 | False |
| schema_0798 | True | 41/41 | 0 | True |
| schema_0799 | True | 201/201 | 0 | True |
| schema_0800 | False | 0/46 | 0 | False |
| schema_0802 | False | 0/245 | 1 | False |
| schema_0804 | False | 0/51 | 0 | False |
| schema_0805 | False | 0/62 | 7 | False |
| schema_0807 | False | 0/202 | 1 | False |
| schema_0809 | True | 93/93 | 0 | True |
| schema_0813 | False | 0/56 | 1 | False |
| schema_0814 | False | 0/71 | 1 | False |
| schema_0815 | True | 181/181 | 0 | True |
| schema_0816 | True | 50/50 | 0 | True |
| schema_0817 | False | 0/56 | 1 | False |
| schema_0819 | False | 0/135 | 1 | False |
| schema_0820 | False | 0/1027 | 1 | False |
| schema_0822 | True | 25/25 | 0 | True |
| schema_0823 | True | 54/54 | 0 | True |
| schema_0829 | False | 0/111 | 1 | False |
| schema_0830 | False | 0/245 | 1 | False |
| schema_0831 | True | 86/86 | 0 | True |
| schema_0836 | True | 57/57 | 0 | True |
| schema_0837 | True | 61/61 | 0 | True |
| schema_0842 | False | 0/21 | 0 | False |
| schema_0843 | False | 0/205 | 1 | False |
| schema_0845 | False | 0/39 | 0 | False |
| schema_0846 | True | 28/28 | 0 | True |
| schema_0847 | False | 0/55 | 1 | False |
| schema_0849 | False | 0/231 | 1 | False |
| schema_0858 | False | 0/56 | 1 | False |
| schema_0859 | False | 0/193 | 1 | False |
| schema_0870 | True | 135/135 | 0 | True |
| schema_0871 | True | 513/514 | 2 | False |
| schema_0874 | True | 234/234 | 0 | True |
| schema_0876 | True | 32/32 | 0 | True |
| schema_0879 | True | 208/208 | 0 | True |
| schema_0881 | False | 0/40 | 1 | False |
| schema_0883 | True | 34/34 | 0 | True |
| schema_0884 | True | 83/83 | 0 | True |
| schema_0889 | False | 0/57 | 1 | False |
| schema_0890 | False | 0/104 | 1 | False |
| schema_0893 | True | 76/76 | 0 | True |
| schema_0899 | False | 0/1375 | 1 | False |
| schema_0900_455237 | True | 181/181 | 0 | True |
| schema_0901_196592 | False | 0/43 | 7 | False |
| schema_0902_537610 | False | 0/505 | 1 | False |
| schema_0903_641274 | False | 0/97 | 1 | False |
| schema_0906_691670 | True | 28/28 | 0 | True |
| schema_0907_160745 | False | 0/234 | 1 | False |
| schema_0908_595029 | False | 0/83 | 1 | False |
| schema_0909_091015 | True | 54/54 | 0 | True |
| schema_0910_646654 | False | 0/23 | 3 | False |
| schema_0911_351848 | False | 0/62 | 1 | False |
| schema_0912_623966 | False | 0/36 | 1 | False |
| schema_0913_078250 | True | 20/20 | 0 | True |
| schema_0914_546220 | False | 0/218 | 1 | False |
| schema_0917_538663 | False | 0/619 | 1 | False |
| schema_0918_205842 | False | 0/656 | 1 | False |
| schema_0921_180722 | False | 0/289 | 1 | False |
| schema_0922_290577 | False | 0/231 | 1 | False |
| schema_0923_391323 | True | 50/50 | 0 | True |
| schema_0924_372982 | False | 0/211 | 4 | False |
| schema_0925_652965 | False | 0/855 | 1 | False |
| schema_0926_444961 | False | 0/94 | 1 | False |
| schema_0927_432405 | False | 0/308 | 1 | False |
| schema_0928_520831 | False | 0/106 | 1 | False |
| schema_0929_108090 | True | 65/65 | 0 | True |
| schema_0930_662565 | False | 0/44 | 0 | False |
| schema_0931_468046 | True | 97/97 | 0 | True |
| schema_0932_662552 | False | 0/430 | 1 | False |
| schema_0933_155171 | True | 453/453 | 0 | True |
| schema_0934_326686 | False | 0/89 | 1 | False |
| schema_0936_106723 | True | 52/52 | 0 | True |
| schema_0937_462804 | False | 0/218 | 1 | False |
| schema_0940_549205 | False | 0/124 | 1 | False |
| schema_0941_659846 | True | 39/39 | 0 | True |
| schema_0942_150757 | False | 0/38 | 1 | False |
| schema_0943_664647 | False | 0/95 | 1 | False |
| schema_0945_570272 | False | 0/55 | 0 | False |
| schema_0948_005703 | True | 118/118 | 0 | True |
| schema_0949_136361 | True | 65/65 | 0 | True |
| schema_0950_614366 | False | 0/167 | 1 | False |
| schema_0952_402169 | False | 0/53 | 1 | False |
| schema_0954_100853 | False | 0/66 | 1 | False |
| schema_0955_026069 | True | 211/211 | 0 | True |
| schema_0956_120022 | False | 0/320 | 1 | False |
| schema_0957_512086 | False | 0/283 | 1 | False |
| schema_0959_117562 | True | 25/25 | 0 | True |
| schema_0960_326291 | False | 0/112 | 1 | False |
| schema_0961_403740 | True | 118/118 | 0 | True |
| schema_0963_525760 | True | 31/31 | 0 | True |
| schema_0964_547031 | True | 88/88 | 0 | True |
| schema_0966_604469 | False | 0/242 | 1 | False |
| schema_0967_047078 | False | 0/2086 | 5 | False |
| schema_0968_637990 | False | 0/318 | 1 | False |
| schema_0969_144544 | True | 138/138 | 0 | True |
| schema_0970_235129 | True | 36/36 | 0 | True |
| schema_0971_260892 | False | 0/213 | 1 | False |
| schema_0972_309020 | False | 0/12 | 28 | False |
| schema_0973_254233 | True | 21/21 | 0 | True |
| schema_0974_336891 | False | 0/40 | 1 | False |
| schema_0975_324672 | False | 0/27 | 0 | False |
| schema_0976_390037 | False | 0/32 | 1 | False |
| schema_0977_609312 | True | 19/19 | 0 | True |
| schema_0978_482243 | True | 135/135 | 0 | True |
| schema_0980_471690 | True | 30/30 | 0 | True |
| schema_0983_295376 | False | 0/19 | 1 | False |
| schema_0984_334739 | True | 78/78 | 1 | False |
| schema_0985_051832 | True | 52/52 | 0 | True |
| schema_0987_242178 | False | 0/66 | 1 | False |
| schema_0989_143776 | True | 38/38 | 0 | True |
| schema_0990_174588 | False | 0/117 | 1 | False |
| schema_0991_336216 | False | 0/118 | 0 | False |
| schema_0992_027652 | True | 29/29 | 0 | True |
| schema_0993_348884 | False | 0/52 | 1 | False |
| schema_0994_684903 | True | 138/138 | 0 | True |
| schema_0995_401888 | False | 0/208 | 1 | False |
| schema_0996_541548 | False | 0/279 | 1 | False |
| schema_0999_062302 | True | 76/76 | 0 | True |
| schema_1000_617352 | False | 0/633 | 1 | False |
| schema_1001_022172 | True | 33/33 | 0 | True |
| schema_1002_179110 | False | 0/120 | 1 | False |
| schema_1003_014791 | True | 15/15 | 0 | True |
| schema_1004_219344 | False | 0/27 | 7 | False |
| schema_1005_570602 | False | 0/81 | 5 | False |
| schema_1007_497366 | True | 15/15 | 0 | True |
| schema_1008_176453 | True | 135/135 | 0 | True |
| schema_1009_358090 | True | 32/32 | 0 | True |
| schema_1010_080239 | False | 0/618 | 1 | False |
| schema_1011_386375 | True | 28/28 | 0 | True |
| schema_1012_059331 | False | 0/42 | 1 | False |
| schema_1013_441410 | True | 135/135 | 0 | True |
| schema_1014_183534 | False | 0/1017 | 1 | False |
| schema_1015_545494 | True | 28/28 | 0 | True |
| schema_1019_073065 | True | 45/45 | 0 | True |
| schema_1020_184540 | False | 0/230 | 1 | False |
| schema_1021_493175 | False | 0/51 | 2 | False |
| schema_1022_393548 | False | 0/222 | 1 | False |
| schema_1023_473037 | False | 0/135 | 1 | False |
| schema_1025_400667 | False | 0/34 | 1 | False |
| schema_1027_665032 | False | 0/37 | 3 | False |
| schema_1029_554720 | True | 28/28 | 0 | True |
| schema_1030_245326 | False | 0/166 | 1 | False |
| schema_1031_610804 | False | 0/604 | 1 | False |
| schema_1032_033274 | False | 0/67 | 5 | False |
| schema_1033_362362 | False | 0/33 | 1 | False |
| schema_1034_531024 | True | 105/105 | 0 | True |
| schema_1035_417385 | False | 0/82 | 1 | False |
| schema_1036_289819 | False | 0/90 | 1 | False |
| schema_1037_521203 | False | 0/364 | 1 | False |
| schema_1039_413086 | True | 181/181 | 0 | True |
| schema_1040_447479 | True | 29/29 | 0 | True |
| schema_1041_644261 | False | 0/52 | 1 | False |
| schema_1042_624410 | True | 54/54 | 0 | True |
| schema_1043_118618 | True | 50/50 | 0 | True |
| schema_1044_019860 | False | 0/128 | 1 | False |
| schema_1045_476826 | True | 52/52 | 0 | True |
| schema_1046_287891 | False | 0/135 | 1 | False |
| schema_1047_207965 | True | 45/45 | 0 | True |
| schema_1050_198025 | True | 32/32 | 0 | True |
| schema_1051_259055 | True | 55/55 | 0 | True |
| schema_1053_675929 | False | 0/123 | 1 | False |
| schema_1055_080731 | False | 0/505 | 1 | False |
| schema_1057_542634 | True | 63/63 | 0 | True |
| schema_1058_453330 | True | 61/61 | 0 | True |
| schema_1059_346369 | False | 0/74 | 2 | False |
| schema_1061_295385 | False | 0/258 | 1 | False |
| schema_1063_000018 | False | 0/447 | 1 | False |
| schema_1064_281329 | True | 47/47 | 0 | True |
| schema_1065_270846 | True | 259/259 | 0 | True |
| schema_1066_508844 | True | 45/45 | 0 | True |
| schema_1068_491851 | False | 0/193 | 1 | False |
| schema_1070_336136 | True | 91/91 | 0 | True |
| schema_1072_659835 | False | 0/342 | 1 | False |
| schema_1073_314345 | False | 0/245 | 1 | False |
| schema_1074_270875 | False | 0/134 | 1 | False |
| schema_1075_084716 | True | 135/135 | 0 | True |
| schema_1076_260105 | True | 16/16 | 0 | True |
| schema_1077_338588 | True | 40/40 | 0 | True |
| schema_1078_600014 | False | 0/245 | 1 | False |
| schema_1079_213377 | False | 0/203 | 1 | False |
| schema_1080_520449 | False | 0/110 | 1 | False |
| schema_1081_289414 | True | 83/83 | 0 | True |
| schema_1082_167670 | True | 165/165 | 0 | True |
| schema_1083_674851 | False | 0/118 | 1 | False |
| schema_1084_417202 | True | 45/45 | 0 | True |
| schema_1085_378499 | True | 63/63 | 0 | True |
| schema_1086_656955 | True | 21/21 | 0 | True |
| schema_1087_556070 | False | 0/119 | 1 | False |
| schema_1088_326764 | True | 40/40 | 0 | True |
| schema_1091_085280 | False | 0/127 | 1 | False |
| schema_1092_364010 | False | 0/543 | 1 | False |
| schema_1096_483661 | False | 0/307 | 1 | False |
| schema_1097_348151 | False | 0/198 | 1 | False |
| schema_1099_654747 | False | 0/33 | 1 | False |
| schema_1100_299606 | False | 0/1149 | 1 | False |
| schema_1101_650753 | True | 152/152 | 5 | False |
| schema_1102_682811 | True | 234/234 | 0 | True |
| schema_1103_115675 | False | 0/37 | 1 | False |
| schema_1105_583941 | False | 0/542 | 1 | False |
| schema_1107_641976 | True | 20/20 | 0 | True |
| schema_1108_251945 | False | 0/110 | 5 | False |
| schema_1109_387896 | True | 33/33 | 0 | True |
| schema_1110_493927 | True | 34/34 | 0 | True |
| schema_1111_287457 | False | 0/43 | 1 | False |
| schema_1112_007491 | True | 732/732 | 0 | True |
| schema_1116_107207 | False | 0/385 | 1 | False |
| schema_1117_622224 | True | 136/136 | 0 | True |
| schema_1118_276995 | False | 0/23 | 1 | False |
| schema_1120_301595 | True | 62/62 | 0 | True |
| schema_1122_217285 | False | 0/1053 | 1 | False |
| schema_1123_278484 | True | 24/24 | 0 | True |
| schema_1125_512036 | False | 0/66 | 0 | False |
| schema_1127_354281 | False | 0/46 | 0 | False |
| schema_1131_139527 | False | 0/132 | 1 | False |
| schema_1132_005273 | True | 135/135 | 0 | True |
| schema_1133_264586 | False | 0/385 | 1 | False |
| schema_1134_654205 | True | 33/33 | 0 | True |
| schema_1136_010581 | True | 21/21 | 0 | True |
| schema_1137_334854 | False | 0/122 | 1 | False |
| schema_1138_419494 | True | 101/101 | 0 | True |
| schema_1139_103727 | True | 65/65 | 0 | True |
| schema_1140_555588 | True | 52/52 | 0 | True |
| schema_1142_235666 | True | 140/140 | 0 | True |
| schema_1145_561835 | False | 0/15 | 0 | False |
| schema_1146_454496 | True | 41/41 | 0 | True |
| schema_1147_662225 | True | 115/115 | 0 | True |
| schema_1148_575663 | False | 0/37 | 1 | False |
| schema_1150_217837 | True | 102/102 | 0 | True |
| schema_1151_048516 | False | 0/956 | 1 | False |
| schema_1152_259631 | False | 0/97 | 15 | False |
| schema_1154_693691 | False | 0/107 | 1 | False |
| schema_1155_119431 | False | 0/385 | 1 | False |
| schema_1157_113711 | False | 0/72 | 1 | False |
| schema_1158_367517 | False | 0/19 | 1 | False |
| schema_1160_679413 | False | 0/162 | 1 | False |
| schema_1161_297667 | False | 0/56 | 1 | False |
| schema_1162_166427 | False | 0/50 | 1 | False |
| schema_1163_147317 | True | 56/56 | 0 | True |
| schema_1165_522626 | False | 0/86 | 1 | False |
| schema_1166_118993 | False | 0/135 | 1 | False |
| schema_1169_027702 | False | 0/177 | 35 | False |
| schema_1170_055247 | True | 59/59 | 0 | True |
| schema_1172_394848 | False | 0/124 | 1 | False |
| schema_1173_307431 | True | 107/107 | 0 | True |
| schema_1174_475536 | False | 0/207 | 1 | False |
| schema_1175_025608 | False | 0/70 | 1 | False |
| schema_1176_594644 | False | 0/162 | 1 | False |
| schema_1177_433889 | False | 0/145 | 1 | False |
| schema_1178_485121 | True | 72/72 | 0 | True |
| schema_1179_497840 | True | 81/81 | 0 | True |
| schema_1182_162164 | False | 0/25 | 1 | False |
| schema_1183_499639 | False | 0/35 | 1 | False |
| schema_1184_316974 | True | 127/127 | 0 | True |
| schema_1185_600277 | True | 157/157 | 0 | True |
| schema_1187_124428 | True | 33/33 | 0 | True |
| schema_1189_344012 | False | 0/112 | 1 | False |
| schema_1190_414439 | False | 0/175 | 1 | False |
| schema_1192_006290 | True | 33/33 | 0 | True |
| schema_1193_607463 | True | 82/82 | 0 | True |
| schema_1195_063455 | False | 0/70 | 1 | False |
| schema_1196_356982 | False | 0/226 | 1 | False |
| schema_1197_304772 | False | 0/897 | 1 | False |
| schema_1198_283986 | True | 33/33 | 0 | True |
| schema_1199_239178 | False | 0/129 | 1 | False |
| schema_1201_239756 | False | 0/1297 | 1 | False |
| schema_1202_625711 | False | 0/124 | 1 | False |
| schema_1204_415528 | True | 47/47 | 0 | True |
| schema_1205_030960 | False | 0/204 | 1 | False |
| schema_1207_239489 | False | 0/27 | 1 | False |
| schema_1214_130697 | True | 32/32 | 0 | True |
| schema_1215_126567 | True | 69/69 | 0 | True |
| schema_1216_629322 | False | 0/432 | 1 | False |
| schema_1218_654100 | True | 71/71 | 0 | True |
| schema_1219_660727 | True | 123/123 | 0 | True |
| schema_1220_019171 | False | 0/347 | 1 | False |
| schema_1221_233519 | False | 0/28 | 3 | False |
| schema_1222_039356 | False | 0/44 | 1 | False |
| schema_1223_109688 | False | 0/66 | 1 | False |
| schema_1224_512880 | True | 20/20 | 31 | False |
| schema_1226_202671 | True | 65/65 | 0 | True |
| schema_1227_189095 | False | 0/76 | 1 | False |
| schema_1228_038090 | False | 0/64 | 1 | False |
| schema_1229_458061 | False | 0/41 | 1 | False |
| schema_1230_271126 | True | 36/36 | 0 | True |
| schema_1231_368533 | True | 167/167 | 0 | True |
| schema_1232_658129 | False | 0/460 | 1 | False |
| schema_1233_471360 | True | 23/23 | 0 | True |
| schema_1235_589752 | True | 34/34 | 0 | True |
| schema_1237_355236 | False | 0/497 | 1 | False |
| schema_1238_617427 | False | 0/117 | 1 | False |
| schema_1239_638548 | False | 0/52 | 1 | False |
| schema_1240_300469 | False | 0/311 | 1 | False |
| schema_1241_258878 | False | 0/104 | 1 | False |
| schema_1242_249341 | False | 0/118 | 1 | False |
| schema_1243_421581 | False | 0/108 | 1 | False |
| schema_1245_589116 | True | 43/43 | 0 | True |
| schema_1246_144281 | True | 65/65 | 0 | True |
| schema_1247_508785 | False | 0/86 | 1 | False |
| schema_1249_289041 | True | 46/46 | 0 | True |
| schema_1251_354516 | True | 76/76 | 0 | True |
| schema_1252_307603 | False | 0/44 | 1 | False |
| schema_1254_666807 | True | 80/80 | 0 | True |
| schema_1256_060874 | False | 0/41 | 0 | False |
| schema_1257_194099 | True | 32/32 | 0 | True |
| schema_1258_595289 | True | 38/38 | 0 | True |
| schema_1259_435992 | False | 0/217 | 1 | False |
| schema_1260_590060 | True | 76/76 | 0 | True |
| schema_1261_504413 | True | 40/40 | 0 | True |
| schema_1262_604319 | True | 91/91 | 0 | True |
| schema_1264_630818 | False | 0/308 | 1 | False |
| schema_1265_471935 | False | 0/217 | 1 | False |
| schema_1267_558937 | True | 50/50 | 0 | True |
| schema_1268_420590 | False | 0/58 | 1 | False |
| schema_1269_326189 | False | 0/385 | 1 | False |
| schema_1270_099383 | False | 0/57 | 1 | False |
| schema_1271_476007 | True | 85/85 | 0 | True |
| schema_1272_534240 | True | 192/192 | 0 | True |
| schema_1273_587363 | False | 0/109 | 2 | False |
| schema_1274_327667 | True | 45/45 | 0 | True |
| schema_1275_254209 | False | 0/1155 | 3 | False |
| schema_1276_694753 | True | 37/37 | 0 | True |
| schema_1278_640451 | True | 44/44 | 0 | True |
| schema_1279_031575 | False | 0/538 | 1 | False |
| schema_1282_521421 | False | 0/447 | 1 | False |
| schema_1283_332944 | True | 68/68 | 0 | True |
| schema_1285_375298 | False | 0/131 | 1 | False |
| schema_1287_022562 | True | 54/54 | 0 | True |
| schema_1289_203345 | False | 0/83 | 1 | False |
| schema_1290_211978 | True | 33/33 | 0 | True |
| schema_1292_596003 | False | 0/57 | 1 | False |
| schema_1293_031816 | True | 83/83 | 0 | True |
| schema_1295_618406 | False | 0/462 | 1 | False |
| schema_1296_538462 | False | 0/37 | 1 | False |
| schema_1297_191052 | True | 143/143 | 0 | True |
| schema_1298_324181 | False | 0/2349 | 1 | False |
| schema_1299_234701 | True | 35/35 | 0 | True |
| schema_1300_274091 | False | 0/246 | 22 | False |
| schema_1301_448226 | True | 61/61 | 0 | True |
| schema_1302_102857 | True | 22/22 | 0 | True |
| schema_1303_061998 | True | 89/89 | 0 | True |
| schema_1304_492215 | False | 0/133 | 1 | False |
| schema_1305_484289 | False | 0/44 | 1 | False |
| schema_1306_204751 | True | 330/330 | 0 | True |
| schema_1307_441345 | False | 0/38 | 1 | False |
| schema_1308_267996 | False | 0/93 | 45 | False |
| schema_1309_516625 | True | 135/135 | 0 | True |
| schema_1312_441794 | True | 34/34 | 0 | True |
| schema_1313_266228 | False | 0/45 | 1 | False |
| schema_1315_574283 | True | 114/114 | 7 | False |
| schema_1317_514500 | True | 27/27 | 0 | True |
| schema_1318_239002 | False | 0/153 | 1 | False |
| schema_1319_042917 | False | 0/35 | 1 | False |

## Blocker details

### schema_0164

```text
syntax error at or near "FOREIGN"
LINE 73: ALTER TABLE venue DROP FOREIGN KEY fk_manager_id;
                                ^
```

- Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY checkin_ibfk_4'
- Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.
- Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY fk_manager_id'
- Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY checkin_ibfk_4'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0173

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0181

```text
there is no unique constraint matching given keys for referenced table "admin"
```

- Unsupported CHECK expression on 'CUSTOMER': '(Admin_Assisstance_Feedback)>=0 AND (Admin_Assisstance_Feedback)<=5' (unsupported CHECK operator)
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0183

```text
syntax error at or near "FOREIGN"
LINE 42: ALTER TABLE article DROP FOREIGN KEY article_ibfk_1;
                                  ^
```

- Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY article_ibfk_1'
- Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY comments_ibfk_2'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0184

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0185

```text
column "G" does not exist
LINE 12:     CHECK (rating = "G" OR rating = "PG" OR rating = "PG-13"...
                             ^
```

- Unsupported CHECK expression on 'Movie': 'rating = "G" OR rating = "PG" OR rating = "PG-13" OR rating = "R" OR rating = "NC-17"' (unknown column)
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0191

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0193

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0195

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0196

```text
syntax error at or near "ENGINE"
LINE 193: ) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0204

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0207

```text
syntax error at or near "02"
LINE 33:     02=February,
             ^
```

- Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Duplicate column names in 'campground'
- Normalization blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Normalization blocker: Duplicate column names in 'campground'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0208

```text
type "titles" does not exist
LINE 5:     title titles,
                  ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0210

```text
syntax error at or near "/"
LINE 11: )/
          ^
```

- Conflicting overlapping FK parent fixture for 'UM_ROLE'.
- Conflicting overlapping FK parent fixture for 'UM_ROLE'.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0217

```text
syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0219

```text
there is no unique constraint matching given keys for referenced table "users_tb"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0220

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0225

```text
syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0229

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0230

```text
type "string" does not exist
LINE 18:     profile STRING
                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0238

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 19:     edited_stamp timestamp NOT NULL DEFAULT '0000-00-00 00:0...
                                                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0247

```text
relation "students" already exists
```

- Conflicting duplicate CREATE TABLE definitions for 'students'; authoritative definition is ambiguous.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unresolved or ambiguous constraint identifier: 'major_id'
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'students'; authoritative definition is ambiguous.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0255

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0266

```text
syntax error at or near "CHARACTER"
LINE 5:     uuid varchar(255) CHARACTER SET utf8mb4 NOT NULL,
                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0267

```text
there is no unique constraint matching given keys for referenced table "events"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0269

```text
there is no unique constraint matching given keys for referenced table "service_reservation"
```

- No isolated invalid-parent witness for FK ROOM_REVIEW.['HotelID', 'RoomNo'] -> ROOM: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK SERVICE_REVIEW.['HotelID', 'Stype'] -> SERVICE: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK BREAKFAST_REVIEW.['HotelID', 'Btype'] -> BREAKFAST: a sibling relationship already guarantees the target parent.

### schema_0272

```text
syntax error at or near "ENGINE"
LINE 20: ) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0273

```text
syntax error at or near "ENGINE"
LINE 37: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0275

```text
constraint "cust_ref_info_pk" for relation "customer_reference_information" already exists
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0277

```text
there is no unique constraint matching given keys for referenced table "restaurants"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0279

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 97: ...ads_latest_update_date timestamp NOT NULL DEFAULT '0000-00-0...
                                                              ^
```

- No isolated invalid-parent witness for FK image_job.['ads_id'] -> ads_job: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK image_job.['ads_id'] -> ads_job: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0280

```text
syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0281

```text
syntax error at or near "ENGINE"
LINE 79: ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 PACK_KEYS=0 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0284

```text
type "bin" does not exist
LINE 19:     chunk bin(127)
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0285

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0290

```text
identity column type must be smallint, integer, or bigint
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0292

```text
there is no unique constraint matching given keys for referenced table "pagina"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0293

```text
there is no unique constraint matching given keys for referenced table "photo"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0320

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0329

```text
syntax error at or near "precision"
LINE 73:     lat DOUBLE PRECISION precision,
                                  ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0332

```text
syntax error at or near "precision"
LINE 9:     cost DOUBLE PRECISION precision,
                                  ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0338

```text
column "disability" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0339

```text
syntax error at or near ","
LINE 61:     Interest float(10,2) not null,
                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0343

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLAT...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0348

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0349

```text
there is no unique constraint matching given keys for referenced table "acct_role"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0353

```text
syntax error at or near "CHAR"
LINE 5:     ATTRIBUTE_NAME VARCHAR(255 CHAR),
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0366

```text
column "created_on" is of type timestamp without time zone but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0368

```text
type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0371

```text
syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0372

```text
there is no unique constraint matching given keys for referenced table "specialties"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0375

```text
syntax error at or near "#"
LINE 3: #auto_increment=0，但是只能后续设置
        ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0376

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0377

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0384

```text
syntax error at or near "("
LINE 18:  INDEX (socialSecurityNumber),
                ^
```


### schema_0392

```text
syntax error at or near "Type"
LINE 15: )Type=InnoDB;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0393

```text
there is no unique constraint matching given keys for referenced table "gender"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0398

```text
there is no unique constraint matching given keys for referenced table "tb_user"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0400

```text
there is no unique constraint matching given keys for referenced table "terminal"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0402

```text
syntax error at or near "CHARACTER"
LINE 4:     username varchar(45) CHARACTER SET utf8 NOT NULL,
                                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0403

```text
column "member" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0405

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0406

```text
syntax error at or near "precision"
LINE 223:     area_pct DOUBLE PRECISION precision CHECK(area_pct BETWE...
                                        ^
```

- Unsupported CHECK expression on 'soil_component': 'coalesce(frac_vfine, 0) + coalesce(frac_fine, 0) + coalesce(frac_med, 0) +\n           coalesce(frac_coarse, 0) + coalesce(frac_vcoarse, 0) BETWEEN 0 AND 1' (unsupported CHECK token)
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0409

```text
syntax error at or near "precision"
LINE 134:     threshold DOUBLE PRECISION precision,
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
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0434

```text
syntax error at or near "ENGINE"
LINE 163: ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0436

```text
there is no unique constraint matching given keys for referenced table "user_info"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0443

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0449

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0454

```text
there is no unique constraint matching given keys for referenced table "tbls"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0470

```text
syntax error at or near ")"
LINE 14: ...comment_date timestamp NOT NULL DEFAULT current_timestamp(),
                                                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0471

```text
syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0490

```text
column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0491

```text
there is no unique constraint matching given keys for referenced table "question"
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
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0493

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=227032 DEFAULT CHARSET=latin1...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0505

```text
foreign key constraint "employees_role_id_fkey" cannot be implemented
DETAIL:  Key columns "role_id" of the referencing table and "id" of the referenced table are of incompatible types: character varying and integer.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0507

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0511

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0512

```text
there is no unique constraint matching given keys for referenced table "archival_institution"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0518

```text
type "identity" does not exist
LINE 162:     LOG_NR_ identity,
                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0521

- Normalization blocker: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0527

```text
syntax error at or near "CHARACTER"
LINE 48:     installation_key varchar(32) CHARACTER SET latin1 NOT NU...
                                          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0530

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0535

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0549

```text
syntax error at or near ")"
LINE 13:     date date NOT NULL DEFAULT current_timestamp()
                                                          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0551

```text
syntax error at or near "precision"
LINE 180:     amount DOUBLE PRECISION precision,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0552

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 CO...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0555

```text
syntax error at or near "ENGINE"
LINE 69: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0567

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0570

```text
syntax error at or near "ENGINE"
LINE 71: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0571

```text
syntax error at or near "idx_attachment_fulltext"
LINE 21:     FULLTEXT KEY idx_attachment_fulltext (string_content)
                          ^
```

- No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0578

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0591

```text
syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0593

```text
syntax error at or near "("
LINE 55:     INDEX (author_id, commit_time),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0597

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0604

```text
syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0611

```text
there is no unique constraint matching given keys for referenced table "chat"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0612

- No isolated invalid-parent witness for FK salaries.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- No isolated invalid-parent witness for FK titles.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0614

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0620

```text
syntax error at or near "PRECISION"
LINE 8:     SALARY DOUBLE PRECISION PRECISION NOT NULL
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0624

```text
cannot use column reference in DEFAULT expression
LINE 654:     STATUS CHAR(1) NULL DEFAULT "C",
                                          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0625

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0639

```text
column "is_active" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0642

```text
syntax error at or near "BTREE"
LINE 14:     PRIMARY KEY (id) USING BTREE
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0648

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0652

```text
syntax error at or near "ENGINE"
LINE 25: ) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0655

```text
syntax error at or near ")"
LINE 8: ...created_at timestamp NOT NULL DEFAULT current_timestamp()(),
                                                                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0660

```text
type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0661

```text
type "long" does not exist
LINE 223:     VALUE_ long,
                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0672

```text
there is no unique constraint matching given keys for referenced table "user_info"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0673

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 C...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0676

```text
syntax error at or near "COMMENT"
LINE 16: ...id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY COMMENT'id...
                                                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0684

```text
syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLAT...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0686

```text
syntax error at or near "precision"
LINE 139:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0694

```text
schema "taxonomy" does not exist
LINE 3: CREATE TABLE taxonomy.high_level
                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0696

```text
column "active" is of type bit but default expression is of type boolean
HINT:  You will need to rewrite or cast the expression.
```

- Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0699

```text
syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0701

```text
relation "vendor" already exists
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0702

```text
syntax error at or near "precision"
LINE 137:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0706

```text
type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0725

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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
LINE 10: ) ENGINE=INNODB DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0734

```text
identity column type must be smallint, integer, or bigint
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0737

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0738

```text
there is no unique constraint matching given keys for referenced table "faculty"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0740

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0742

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Unsupported CHECK expression on 'transactions': 'json_valid(meta)' (unsupported CHECK operator)
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0745

```text
syntax error at or near "precision"
LINE 112:     temp_c DOUBLE PRECISION precision,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0755

```text
syntax error at or near "("
LINE 14:   PRIMARY KEY (member_id)
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0761

```text
there is no unique constraint matching given keys for referenced table "device"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0764

```text
there is no unique constraint matching given keys for referenced table "categories"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0772

```text
syntax error at or near "##"
LINE 3: ##为空则没有到，
        ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0778

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0781

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0790

```text
syntax error at or near ")"
LINE 6: ..._created_at timestamp NOT NULL DEFAULT current_timestamp()()
                                                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0796

```text
syntax error at or near "ENGINE"
LINE 6: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0800

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 14:         LAST_MODIFIED_TIME TIMESTAMP DEFAULT '0000-00-00 00:...
                                                      ^
```


### schema_0802

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=innodb DEFAULT CHARACTER SET utf8mb4 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0804

```text
schema "clin_prescribing" does not exist
LINE 4: CREATE TABLE clin_prescribing.medications
                     ^
```


### schema_0805

```text
syntax error at or near "02"
LINE 33:     02=February,
             ^
```

- Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Duplicate column names in 'campground'
- Normalization blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Normalization blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Normalization blocker: Duplicate column names in 'campground'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0807

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0813

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 19:     modifieddatetime timestamp NOT NULL DEFAULT '0000-00-00 ...
                                                         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0814

```text
syntax error at or near "LIMIT"
LINE 35: CREATE TABLE LIMIT
                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0817

```text
there is no unique constraint matching given keys for referenced table "roles"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0819

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0820

```text
syntax error at or near "CHARACTER"
LINE 5:     object_type varchar(1) CHARACTER SET latin1 NOT NULL,
                                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0829

```text
syntax error at or near "CHARACTER"
LINE 5:     name varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0830

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0845

```text
relation "logging_event_id_seq" does not exist
LINE 18:     event_id          INT DEFAULT nextval('logging_event_id_...
                                                   ^
```


### schema_0847

```text
syntax error at or near "engine"
LINE 9: ) engine=innodb comment '学院表';
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0849

```text
syntax error at or near ")"
LINE 21: ...  createdtime timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0858

```text
syntax error at or near "CHARACTER"
LINE 5:     categoryname varchar(255) CHARACTER SET latin1 NOT NULL,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0859

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_gene...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0871

- Reference timeout/query cancellation: diagnostic recheck cannot clear the original failure; resolve execution stability before freezing.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Failed test categories: {'database_timeout_or_cancel': 1}
- Unscored timeout/cancellation recheck retained in JSON; DDL success: True. Original failure not replaced.

### schema_0881

```text
relation "seq_employee_id" does not exist
LINE 4:     employee_id integer NOT NULL DEFAULT nextval('seq_employ...
                                                         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0889

```text
syntax error at or near "CHARACTER"
LINE 5:     description varchar(255) CHARACTER SET utf8mb4 NOT NULL ...
                                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0890

```text
syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0899

```text
syntax error at or near "precision"
LINE 95:     strike DOUBLE PRECISION precision NOT NULL,
                                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0901_196592

```text
syntax error at or near "."
LINE 45:     eg. player 1,
               ^
```

- Could not parse ground-truth column: 'eg. player 1'
- Could not parse ground-truth column: 'etc.\n  PLAYER_ID int'
- Unresolved or ambiguous constraint identifier: 'PLAYER_ID'
- Normalization blocker: Could not parse ground-truth column: 'eg. player 1'
- Normalization blocker: Could not parse ground-truth column: 'etc.\n  PLAYER_ID int'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'PLAYER_ID'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0902_537610

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0903_641274

```text
syntax error at or near "TYPE"
LINE 142: ) TYPE=INNODB;
            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0907_160745

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0908_595029

```text
syntax error at or near "char"
LINE 6:     JOB_NAME VARCHAR(100 char) NOT NULL,
                                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0910_646654

```text
syntax error at or near "engine"
LINE 24: ) engine=MyISAM
           ^
```

- No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0911_351848

```text
there is no unique constraint matching given keys for referenced table "criteria"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0912_623966

```text
syntax error at or near "UQ_SINGER_1"
LINE 9:     UNIQUE UQ_SINGER_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0914_546220

```text
syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0917_538663

```text
syntax error at or near "ENGINE"
LINE 18: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COL...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0918_205842

```text
syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0921_180722

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0922_290577

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0924_372982

```text
syntax error at or near ";"
LINE 25: CREATE TABLE sqlite_stat1(tbl,idx,stat);
                                                ^
```

- Could not determine data type for 'sqlite_stat1.tbl'.
- Could not determine data type for 'sqlite_stat1.idx'.
- Could not determine data type for 'sqlite_stat1.stat'.
- Normalization blocker: Excluded by protocol v4: source contains SQLite internal sqlite_stat1 metadata, not an application schema.

### schema_0925_652965

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0926_444961

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 CO...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0927_432405

```text
syntax error at or near "CHARACTER"
LINE 52:     events_name varchar(255) CHARACTER SET utf8 NOT NULL,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0928_520831

```text
syntax error at or near "user"
LINE 31:   FOREIGN KEY (user) REFERENCES "user"(email)
                        ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0930_662565

```text
type "varhcar" does not exist
LINE 9:     name VARHCAR(100) NOT NULL
                 ^
```


### schema_0932_662552

```text
syntax error at or near "ENGINE"
LINE 196: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0934_326686

```text
there is no unique constraint matching given keys for referenced table "user"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0937_462804

```text
syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0940_549205

```text
column "invitation" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0942_150757

```text
syntax error at or near ")"
LINE 22: ... "date-time" timestamp NOT NULL DEFAULT current_timestamp(),
                                                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0943_664647

```text
syntax error at or near "("
LINE 10:     created_at timestamp NULL DEFAULT NULL(),
                                                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0945_570272

```text
type "varchar_ignorecase" does not exist
LINE 7:   sid varchar_ignorecase(100) not null,
              ^
```


### schema_0950_614366

```text
syntax error at or near "referencesposition"
LINE 71:     foreign key (position_id) referencesposition(position_id...
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0952_402169

```text
column "aircraft_id" named in key does not exist
LINE 17:     PRIMARY KEY (aircraft_id)
             ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0954_100853

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0956_120022

```text
syntax error at or near "precision"
LINE 213:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0957_512086

```text
there is no unique constraint matching given keys for referenced table "procedure_in_consultation"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0960_326291

```text
syntax error at or near ")"
LINE 8:     createdat TIMESTAMP DEFAULT current_timestamp(),
                                                          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0966_604469

```text
syntax error at or near "CHARACTER"
LINE 28:     msgid varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
                                ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0967_047078

```text
syntax error at or near "ENGINE"
LINE 224: ) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
            ^
```

- Conflicting overlapping FK parent fixture for 'wiki_article'.
- Conflicting overlapping FK parent fixture for 'wiki_attachment'.
- Conflicting overlapping FK parent fixture for 'wiki_revisionplugin'.
- Conflicting overlapping FK parent fixture for 'wiki_urlpath'.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0968_637990

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'ad_locales'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0974_336891

```text
syntax error at or near "ENGINE"
LINE 13: )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unico...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0975_324672

```text
there is no unique constraint matching given keys for referenced table "artist"
```


### schema_0976_390037

```text
there is no unique constraint matching given keys for referenced table "log"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0983_295376

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0984_334739

- No isolated invalid-parent witness for FK plot_checks.['lab_id'] -> labs: a sibling relationship already guarantees the target parent.

### schema_0987_242178

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0990_174588

```text
there is no unique constraint matching given keys for referenced table "transfers"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0991_336216

```text
relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
```


### schema_0993_348884

```text
type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0995_401888

```text
type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0996_541548

```text
type "year" does not exist
LINE 19:     graduation_year year(4) NOT NULL
                             ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1000_617352

```text
syntax error at or near "alert_send_all"
LINE 26:     UNIQUE alert_send_all (layout_id, alert_id, current_id, ...
                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1002_179110

```text
type "bin" does not exist
LINE 17:     att_bin bin(10)
                     ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1004_219344

```text
syntax error at or near "ALTER"
LINE 29: ALTER TABLE roles_users ADD CONSTRAINT roles_fk FOREIGN KEY ...
         ^
```

- Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1005_570602

```text
syntax error at or near "("
LINE 82: ALTER TABLE departments ADD ( CONSTRAINT dept_mgr_fk FOREIGN...
                                     ^
```

- ALTER TABLE ADD COLUMN has missing or duplicate identifier: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Normalization blocker: ALTER TABLE ADD COLUMN has missing or duplicate identifier: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1010_080239

```text
syntax error at or near "precision"
LINE 66:     fee_amount DOUBLE PRECISION precision,
                                         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1012_059331

```text
syntax error at or near ","
LINE 9:     PREVAILING_WAGE FLOAT(10,2) NOT NULL,
                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1014_183534

```text
syntax error at or near "alert_send_all"
LINE 27:     UNIQUE alert_send_all (layout_id, alert_id, current_id, ...
                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1020_184540

```text
syntax error at or near "CHARACTER"
LINE 10:     response_id varchar(255) CHARACTER SET ascii DEFAULT NUL...
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1021_493175

```text
column "enabled" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1022_393548

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1023_473037

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1025_400667

```text
foreign key constraint "advdata_gatewayseqno_fkey" cannot be implemented
DETAIL:  Key columns "gatewayseqno" of the referencing table and "gatewayseqno" of the referenced table are of incompatible types: character varying and integer.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1027_665032

```text
constraint "fixture_id_fk" for relation "motion_packets" already exists
```

- No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1030_245326

```text
identity column type must be smallint, integer, or bigint
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1031_610804

```text
syntax error at or near "ENGINE"
LINE 343: ) ENGINE=innodb AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1032_033274

```text
there is no unique constraint matching given keys for referenced table "customers"
```

- Unresolved or ambiguous constraint identifier: 'products_id'
- Unresolved or ambiguous constraint identifier: 'orders_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'products_id'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'orders_id'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1033_362362

```text
syntax error at or near "UQ_CONTACT_1"
LINE 8:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1035_417385

```text
type "badge" does not exist
LINE 25:     badge badge DEFAULT 'none'::badge,
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1036_289819

```text
cannot use column reference in DEFAULT expression
LINE 48:     stato varchar(20) NOT NULL DEFAULT "In attesa",
                                                ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1037_521203

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1041_644261

```text
type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1044_019860

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1046_287891

```text
syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1053_675929

```text
syntax error at or near "ENGINE"
LINE 25: ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1055_080731

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1059_346369

```text
syntax error at or near "same"
LINE 4: CREATE TABLE statements same as in Figure 5.1b  */
                                ^
```

- Could not resolve CREATE TABLE state before applying ALTER statements.
- Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.

### schema_1061_295385

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1063_000018

```text
there is no unique constraint matching given keys for referenced table "tbls"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1068_491851

```text
syntax error at or near "CHARACTER"
LINE 6:     name varchar(40) CHARACTER SET utf8 NOT NULL,
                             ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1072_659835

```text
syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1073_314345

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1074_270875

```text
syntax error at or near ")"
LINE 73: ...ssion_time timestamp NOT NULL DEFAULT current_timestamp()(),
                                                                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1078_600014

```text
syntax error at or near "ENGINE"
LINE 13: ) ENGINE=innodb DEFAULT CHARACTER SET utf8mb4 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1079_213377

```text
syntax error at or near "precision"
LINE 137:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1080_520449

```text
syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1083_674851

```text
there is no unique constraint matching given keys for referenced table "users"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1087_556070

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_genera...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1091_085280

```text
date/time field value out of range: "0000-00-00 00:00:00"
LINE 32:     creation_date TIMESTAMP NOT NULL default '0000-00-00 00:...
                                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1092_364010

```text
syntax error at or near "ENGINE"
LINE 233: )ENGINE=InnoDB DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1096_483661

```text
syntax error at or near "CHARACTER"
LINE 5:     name varchar(80) CHARACTER SET utf8 NOT NULL,
                             ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1097_348151

```text
syntax error at or near "TYPE"
LINE 8: ) TYPE=InnoDB;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1099_654747

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1100_299606

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1101_650753

- No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1103_115675

```text
syntax error at or near "key"
LINE 24:     email_id varchar(50) not null unique key,
                                                  ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1105_583941

```text
syntax error at or near "PRECISION"
LINE 50:     MAXDEBT DOUBLE PRECISION PRECISION DEFAULT 0 NOT NULL,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1108_251945

```text
relation "driver" already exists
```

- Conflicting duplicate CREATE TABLE definitions for 'driver'; authoritative definition is ambiguous.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'driver'; authoritative definition is ambiguous.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1111_287457

```text
there is no unique constraint matching given keys for referenced table "languages"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1116_107207

```text
syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1118_276995

```text
there is no unique constraint matching given keys for referenced table "email"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1122_217285

```text
syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1133_264586

```text
syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1137_334854

```text
syntax error at or near "ENGINE"
LINE 38: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1145_561835

```text
type "test29_master_depend" does not exist
LINE 11:     index test29_master_depend ( depend1_id ),
                   ^
```


### schema_1148_575663

```text
there is no unique constraint matching given keys for referenced table "person"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1151_048516

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1152_259631

```text
relation "act_ru_variable" does not exist
```

- ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Normalization blocker: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Normalization blocker: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1154_693691

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1155_119431

```text
syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1157_113711

```text
there is no unique constraint matching given keys for referenced table "user"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1158_367517

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1160_679413

```text
syntax error at or near "CHAR"
LINE 4:     Physician_Profile_ID VARCHAR(38 CHAR),
                                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1161_297667

```text
syntax error at or near "ASC"
LINE 18:     INDEX fk_hospital_adress1_idx (adress_id ASC) VISIBLE,
                                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1162_166427

```text
type "year" does not exist
LINE 8:     Year YEAR,
                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1165_522626

```text
syntax error at or near "PRECISION"
LINE 33:     DOUBLE_VAL DOUBLE PRECISION PRECISION,
                                         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1166_118993

```text
there is no unique constraint matching given keys for referenced table "user"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1169_027702

```text
syntax error at or near ")"
LINE 50:     Entry timestamp default(current_timestamp())
                                                       ^
```

- Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'student'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Could not resolve CREATE TABLE state before applying ALTER statements.
- Unresolved or ambiguous ALTER TABLE constraint/index drop: 'drop foreign key myrule'
- Could not parse a CREATE TABLE definition.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Unresolved or ambiguous constraint identifier: 'studentid'
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Conflicting overlapping FK parent fixture for 'categories'.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'student'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'drop foreign key myrule'
- Normalization blocker: Could not parse a CREATE TABLE definition.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'studentid'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1172_394848

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1174_475536

```text
there is no unique constraint matching given keys for referenced table "mrbs_room"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1175_025608

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1176_594644

```text
there is no unique constraint matching given keys for referenced table "team"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1177_433889

```text
there is no unique constraint matching given keys for referenced table "city"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1182_162164

```text
there is no unique constraint matching given keys for referenced table "nasabah"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1183_499639

```text
syntax error at or near "engine"
LINE 11: )engine=InnoDB;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1189_344012

```text
there is no unique constraint matching given keys for referenced table "users"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1190_414439

```text
there is no unique constraint matching given keys for referenced table "auth_permission"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1195_063455

```text
type modifier is not allowed for type "bytea"
LINE 13:     BYTES_ BYTEA(max),
                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1196_356982

```text
there is no unique constraint matching given keys for referenced table "fire_station_information"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1197_304772

```text
syntax error at or near "attribute_values_attributes_id_value"
LINE 30:     UNIQUE attribute_values_attributes_id_value (attributes_...
                    ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1199_239178

```text
there is no unique constraint matching given keys for referenced table "auth_groups"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1201_239756

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1202_625711

```text
syntax error at or near "CHARACTER"
LINE 5:     author varchar(40) CHARACTER SET utf8 NULL DEFAULT NULL,
                               ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1205_030960

```text
column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1207_239489

```text
syntax error at or near "ENGINE"
LINE 6: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1216_629322

```text
there is no unique constraint matching given keys for referenced table "tbls"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1220_019171

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1221_233519

```text
column "magv" referenced in foreign key constraint does not exist
```

- Unresolved or ambiguous constraint identifier: 'MaGV'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'MaGV'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1222_039356

```text
type "identity" does not exist
LINE 4:     id identity primary key,
               ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1223_109688

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

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

### schema_1227_189095

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1228_038090

```text
there is no unique constraint matching given keys for referenced table "users"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1229_458061

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 CO...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1232_658129

```text
syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1237_355236

```text
syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1238_617427

```text
syntax error at or near "ENGINE"
LINE 18: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1239_638548

```text
type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1240_300469

```text
function curdate() does not exist
LINE 58:     datedebon date         NOT NULL DEFAULT curdate(),
                                                     ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1241_258878

```text
syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1242_249341

```text
syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1243_421581

```text
column "verified" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1247_508785

```text
syntax error at or near "PRECISION"
LINE 33:     DOUBLE_VAL DOUBLE PRECISION PRECISION,
                                         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1252_307603

```text
syntax error at or near "CHARACTER"
LINE 5:     name varchar(255) CHARACTER SET utf8 NOT NULL,
                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1256_060874

```text
type "long" does not exist
LINE 8: PHONE LONG, 
              ^
```


### schema_1259_435992

```text
type "identity" does not exist
LINE 162:     LOG_NR_ identity,
                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1264_630818

```text
syntax error at or near "ENGINE"
LINE 29: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1265_471935

```text
syntax error at or near "precision"
LINE 115:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1268_420590

```text
syntax error at or near "CHARACTER"
LINE 5:     username char(10) CHARACTER SET latin1 NOT NULL,
                              ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1269_326189

```text
syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1270_099383

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1273_587363

```text
syntax error at or near "#"
LINE 3: # 用户ID
        ^
```

- Unsupported CHECK expression on 'orders': "value in ('预订中','已入住','已退房')" (unknown column)
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1275_254209

```text
there is no unique constraint matching given keys for referenced table "ref_biz_data_inst"
```

- Conflicting overlapping FK parent fixture for 'user_'.
- Conflicting overlapping FK parent fixture for 'user_'.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1279_031575

```text
syntax error at or near "PRECISION"
LINE 50:     MAXDEBT DOUBLE PRECISION PRECISION DEFAULT 0 NOT NULL,
                                      ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1282_521421

```text
there is no unique constraint matching given keys for referenced table "tbls"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1285_375298

```text
syntax error at or near "CHARACTER"
LINE 6:     img varchar(64) CHARACTER SET utf8 DEFAULT NULL,
                            ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1289_203345

```text
type "varchar2" does not exist
LINE 4:     key varchar2(1024) NOT NULL,
                ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1292_596003

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 CO...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1295_618406

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1296_538462

```text
syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1298_324181

```text
identity column type must be smallint, integer, or bigint
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1300_274091

```text
relation "xxx" already exists
```

- Conflicting duplicate CREATE TABLE definitions for 'xxx'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 't0_1'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'x'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 'logged'; authoritative definition is ambiguous.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Unresolved or ambiguous constraint identifier: 'a'
- Unsupported CHECK expression on 'tab2': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'tab3': 'c2-c3<80' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_4': 'c2+c3<100.0' (unsupported CHECK token)
- Unsupported CHECK expression on 'renc_5': 'c2-c3<80' (unsupported CHECK token)
- No bounded CHECK-compatible fixture found for 'atdc_1_constraints'.
- No isolated invalid CHECK witness for atdc_1_constraints: 'c is not null'
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'xxx'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't0_1'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'x'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'logged'; authoritative definition is ambiguous.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'a'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1304_492215

```text
identity column type must be smallint, integer, or bigint
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1305_484289

```text
syntax error at or near ")"
LINE 25: ... publish_date timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1307_441345

```text
there is no unique constraint matching given keys for referenced table "filiere"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1308_267996

```text
syntax error at or near "FOREIGN"
LINE 104: DROP FOREIGN KEY FKSection_deptId,
               ^
```

- Unsupported ALTER TABLE operation; not applied: 'DROP major'
- Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Unsupported ALTER TABLE operation; not applied: 'DROP title'
- Unsupported ALTER TABLE operation; not applied: 'DROP number'
- Unsupported ALTER TABLE operation; not applied: 'DROP numUnits'
- Unsupported ALTER TABLE operation; not applied: 'DROP deptId'
- Unsupported ALTER TABLE operation; not applied: 'DROP courseId'
- Unsupported ALTER TABLE constraint: 'DROP major'
- Unsupported ALTER TABLE target: 'DROP dept,\nADD CONSTRAINT FKSection_deptId \nFOREIGN KEY (deptId)\nREFERENCES Department(id) ON DELETE SET NULL ON UPDATE CASCADE'
- Unsupported ALTER TABLE constraint: 'DROP dept'
- Unsupported ALTER TABLE target: 'DROP title,\nDROP number,\nDROP numUnits,\nDROP FOREIGN KEY FKSection_deptId,\nDROP deptId,\nADD CONSTRAINT FKSection_courseId \nFOREIGN KEY (courseId)\nREFERENCES Course(id) ON DELETE SET NULL ON UPDATE CASCADE'
- Unsupported ALTER TABLE target: 'DROP FOREIGN KEY FKSection_courseId,\nDROP courseId'
- Unresolved or ambiguous constraint identifier: 'majorId'
- Unresolved or ambiguous constraint identifier: 'majorId'
- Unresolved or ambiguous constraint identifier: 'majorId'
- Unresolved or ambiguous constraint identifier: 'deptId'
- Unresolved or ambiguous constraint identifier: 'deptId'
- Unresolved or ambiguous constraint identifier: 'deptId'
- No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP major'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP title'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP number'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP numUnits'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP deptId'
- Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP courseId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP major'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP dept'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP title'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP number'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP numUnits'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_deptId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP deptId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_courseId'
- Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP courseId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'deptId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'courseId'
- Normalization blocker: Unresolved or ambiguous constraint identifier: 'majorId'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1313_266228

```text
syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1315_574283

- No isolated invalid CHECK witness for series: 'pays is not null'
- No isolated invalid CHECK witness for series: 'dateS is not null'
- No isolated invalid CHECK witness for utilisateur: 'dateI is not null'
- No isolated invalid CHECK witness for episode: 'datedif is not null'
- No isolated invalid CHECK witness for staff: 'nom is not null'
- No isolated invalid CHECK witness for staff: 'prenom is not null'
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1318_239002

```text
syntax error at or near ")"
LINE 32:     date TIMESTAMP NOT NULL DEFAULT current_timestamp()
                                                               ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1319_042917

```text
syntax error at or near "ALTER"
LINE 31: ALTER TABLE user_role
         ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

