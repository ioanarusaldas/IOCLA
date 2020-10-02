
normal_loop_op:     file format elf32-i386


Disassembly of section .init:

00000408 <_init>:
 408:	53                   	push   ebx
 409:	83 ec 08             	sub    esp,0x8
 40c:	e8 6f 01 00 00       	call   580 <__x86.get_pc_thunk.bx>
 411:	81 c3 bf 1b 00 00    	add    ebx,0x1bbf
 417:	8b 83 24 00 00 00    	mov    eax,DWORD PTR [ebx+0x24]
 41d:	85 c0                	test   eax,eax
 41f:	74 05                	je     426 <_init+0x1e>
 421:	e8 62 00 00 00       	call   488 <__gmon_start__@plt>
 426:	83 c4 08             	add    esp,0x8
 429:	5b                   	pop    ebx
 42a:	c3                   	ret    

Disassembly of section .plt:

00000430 <.plt>:
 430:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
 436:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
 43c:	00 00                	add    BYTE PTR [eax],al
	...

00000440 <gettimeofday@plt>:
 440:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
 446:	68 00 00 00 00       	push   0x0
 44b:	e9 e0 ff ff ff       	jmp    430 <.plt>

00000450 <__stack_chk_fail@plt>:
 450:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
 456:	68 08 00 00 00       	push   0x8
 45b:	e9 d0 ff ff ff       	jmp    430 <.plt>

00000460 <__libc_start_main@plt>:
 460:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
 466:	68 10 00 00 00       	push   0x10
 46b:	e9 c0 ff ff ff       	jmp    430 <.plt>

00000470 <__printf_chk@plt>:
 470:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
 476:	68 18 00 00 00       	push   0x18
 47b:	e9 b0 ff ff ff       	jmp    430 <.plt>

Disassembly of section .plt.got:

00000480 <__cxa_finalize@plt>:
 480:	ff a3 20 00 00 00    	jmp    DWORD PTR [ebx+0x20]
 486:	66 90                	xchg   ax,ax

00000488 <__gmon_start__@plt>:
 488:	ff a3 24 00 00 00    	jmp    DWORD PTR [ebx+0x24]
 48e:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000490 <main>:
 490:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 494:	83 e4 f0             	and    esp,0xfffffff0
 497:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 49a:	55                   	push   ebp
 49b:	89 e5                	mov    ebp,esp
 49d:	56                   	push   esi
 49e:	53                   	push   ebx
 49f:	51                   	push   ecx
 4a0:	e8 db 00 00 00       	call   580 <__x86.get_pc_thunk.bx>
 4a5:	81 c3 2b 1b 00 00    	add    ebx,0x1b2b
 4ab:	83 ec 34             	sub    esp,0x34
 4ae:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 4b4:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 4b7:	31 c0                	xor    eax,eax
 4b9:	8d 45 d4             	lea    eax,[ebp-0x2c]
 4bc:	6a 00                	push   0x0
 4be:	50                   	push   eax
 4bf:	e8 7c ff ff ff       	call   440 <gettimeofday@plt>
 4c4:	8d b3 70 5a 62 02    	lea    esi,[ebx+0x2625a70]
 4ca:	8d 83 70 00 00 00    	lea    eax,[ebx+0x70]
 4d0:	83 c4 10             	add    esp,0x10
 4d3:	8b 16                	mov    edx,DWORD PTR [esi]
 4d5:	8d 88 00 5a 62 02    	lea    ecx,[eax+0x2625a00]
 4db:	90                   	nop
 4dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 4e0:	03 10                	add    edx,DWORD PTR [eax]
 4e2:	83 c0 04             	add    eax,0x4
 4e5:	39 c8                	cmp    eax,ecx
 4e7:	75 f7                	jne    4e0 <main+0x50>
 4e9:	8d 45 dc             	lea    eax,[ebp-0x24]
 4ec:	83 ec 08             	sub    esp,0x8
 4ef:	89 16                	mov    DWORD PTR [esi],edx
 4f1:	6a 00                	push   0x0
 4f3:	50                   	push   eax
 4f4:	e8 47 ff ff ff       	call   440 <gettimeofday@plt>
 4f9:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 4fc:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 4ff:	83 c4 0c             	add    esp,0xc
 502:	69 c0 40 42 0f 00    	imul   eax,eax,0xf4240
 508:	03 45 e0             	add    eax,DWORD PTR [ebp-0x20]
 50b:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
 50e:	50                   	push   eax
 50f:	8d 83 50 e7 ff ff    	lea    eax,[ebx-0x18b0]
 515:	50                   	push   eax
 516:	6a 01                	push   0x1
 518:	e8 53 ff ff ff       	call   470 <__printf_chk@plt>
 51d:	83 c4 10             	add    esp,0x10
 520:	31 c0                	xor    eax,eax
 522:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
 525:	65 33 35 14 00 00 00 	xor    esi,DWORD PTR gs:0x14
 52c:	75 0b                	jne    539 <main+0xa9>
 52e:	8d 65 f4             	lea    esp,[ebp-0xc]
 531:	59                   	pop    ecx
 532:	5b                   	pop    ebx
 533:	5e                   	pop    esi
 534:	5d                   	pop    ebp
 535:	8d 61 fc             	lea    esp,[ecx-0x4]
 538:	c3                   	ret    
 539:	e8 b2 01 00 00       	call   6f0 <__stack_chk_fail_local>

0000053e <_start>:
 53e:	31 ed                	xor    ebp,ebp
 540:	5e                   	pop    esi
 541:	89 e1                	mov    ecx,esp
 543:	83 e4 f0             	and    esp,0xfffffff0
 546:	50                   	push   eax
 547:	54                   	push   esp
 548:	52                   	push   edx
 549:	e8 22 00 00 00       	call   570 <_start+0x32>
 54e:	81 c3 82 1a 00 00    	add    ebx,0x1a82
 554:	8d 83 10 e7 ff ff    	lea    eax,[ebx-0x18f0]
 55a:	50                   	push   eax
 55b:	8d 83 b0 e6 ff ff    	lea    eax,[ebx-0x1950]
 561:	50                   	push   eax
 562:	51                   	push   ecx
 563:	56                   	push   esi
 564:	ff b3 28 00 00 00    	push   DWORD PTR [ebx+0x28]
 56a:	e8 f1 fe ff ff       	call   460 <__libc_start_main@plt>
 56f:	f4                   	hlt    
 570:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 573:	c3                   	ret    
 574:	66 90                	xchg   ax,ax
 576:	66 90                	xchg   ax,ax
 578:	66 90                	xchg   ax,ax
 57a:	66 90                	xchg   ax,ax
 57c:	66 90                	xchg   ax,ax
 57e:	66 90                	xchg   ax,ax

00000580 <__x86.get_pc_thunk.bx>:
 580:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 583:	c3                   	ret    
 584:	66 90                	xchg   ax,ax
 586:	66 90                	xchg   ax,ax
 588:	66 90                	xchg   ax,ax
 58a:	66 90                	xchg   ax,ax
 58c:	66 90                	xchg   ax,ax
 58e:	66 90                	xchg   ax,ax

00000590 <deregister_tm_clones>:
 590:	e8 e4 00 00 00       	call   679 <__x86.get_pc_thunk.dx>
 595:	81 c2 3b 1a 00 00    	add    edx,0x1a3b
 59b:	8d 8a 38 00 00 00    	lea    ecx,[edx+0x38]
 5a1:	8d 82 38 00 00 00    	lea    eax,[edx+0x38]
 5a7:	39 c8                	cmp    eax,ecx
 5a9:	74 1d                	je     5c8 <deregister_tm_clones+0x38>
 5ab:	8b 82 1c 00 00 00    	mov    eax,DWORD PTR [edx+0x1c]
 5b1:	85 c0                	test   eax,eax
 5b3:	74 13                	je     5c8 <deregister_tm_clones+0x38>
 5b5:	55                   	push   ebp
 5b6:	89 e5                	mov    ebp,esp
 5b8:	83 ec 14             	sub    esp,0x14
 5bb:	51                   	push   ecx
 5bc:	ff d0                	call   eax
 5be:	83 c4 10             	add    esp,0x10
 5c1:	c9                   	leave  
 5c2:	c3                   	ret    
 5c3:	90                   	nop
 5c4:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 5c8:	f3 c3                	repz ret 
 5ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

000005d0 <register_tm_clones>:
 5d0:	e8 a4 00 00 00       	call   679 <__x86.get_pc_thunk.dx>
 5d5:	81 c2 fb 19 00 00    	add    edx,0x19fb
 5db:	55                   	push   ebp
 5dc:	8d 8a 38 00 00 00    	lea    ecx,[edx+0x38]
 5e2:	8d 82 38 00 00 00    	lea    eax,[edx+0x38]
 5e8:	29 c8                	sub    eax,ecx
 5ea:	89 e5                	mov    ebp,esp
 5ec:	53                   	push   ebx
 5ed:	c1 f8 02             	sar    eax,0x2
 5f0:	89 c3                	mov    ebx,eax
 5f2:	83 ec 04             	sub    esp,0x4
 5f5:	c1 eb 1f             	shr    ebx,0x1f
 5f8:	01 d8                	add    eax,ebx
 5fa:	d1 f8                	sar    eax,1
 5fc:	74 14                	je     612 <register_tm_clones+0x42>
 5fe:	8b 92 2c 00 00 00    	mov    edx,DWORD PTR [edx+0x2c]
 604:	85 d2                	test   edx,edx
 606:	74 0a                	je     612 <register_tm_clones+0x42>
 608:	83 ec 08             	sub    esp,0x8
 60b:	50                   	push   eax
 60c:	51                   	push   ecx
 60d:	ff d2                	call   edx
 60f:	83 c4 10             	add    esp,0x10
 612:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 615:	c9                   	leave  
 616:	c3                   	ret    
 617:	89 f6                	mov    esi,esi
 619:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00000620 <__do_global_dtors_aux>:
 620:	55                   	push   ebp
 621:	89 e5                	mov    ebp,esp
 623:	53                   	push   ebx
 624:	e8 57 ff ff ff       	call   580 <__x86.get_pc_thunk.bx>
 629:	81 c3 a7 19 00 00    	add    ebx,0x19a7
 62f:	83 ec 04             	sub    esp,0x4
 632:	80 bb 50 00 00 00 00 	cmp    BYTE PTR [ebx+0x50],0x0
 639:	75 27                	jne    662 <__do_global_dtors_aux+0x42>
 63b:	8b 83 20 00 00 00    	mov    eax,DWORD PTR [ebx+0x20]
 641:	85 c0                	test   eax,eax
 643:	74 11                	je     656 <__do_global_dtors_aux+0x36>
 645:	83 ec 0c             	sub    esp,0xc
 648:	ff b3 34 00 00 00    	push   DWORD PTR [ebx+0x34]
 64e:	e8 2d fe ff ff       	call   480 <__cxa_finalize@plt>
 653:	83 c4 10             	add    esp,0x10
 656:	e8 35 ff ff ff       	call   590 <deregister_tm_clones>
 65b:	c6 83 50 00 00 00 01 	mov    BYTE PTR [ebx+0x50],0x1
 662:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 665:	c9                   	leave  
 666:	c3                   	ret    
 667:	89 f6                	mov    esi,esi
 669:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00000670 <frame_dummy>:
 670:	55                   	push   ebp
 671:	89 e5                	mov    ebp,esp
 673:	5d                   	pop    ebp
 674:	e9 57 ff ff ff       	jmp    5d0 <register_tm_clones>

00000679 <__x86.get_pc_thunk.dx>:
 679:	8b 14 24             	mov    edx,DWORD PTR [esp]
 67c:	c3                   	ret    
 67d:	66 90                	xchg   ax,ax
 67f:	90                   	nop

00000680 <__libc_csu_init>:
 680:	55                   	push   ebp
 681:	57                   	push   edi
 682:	56                   	push   esi
 683:	53                   	push   ebx
 684:	e8 f7 fe ff ff       	call   580 <__x86.get_pc_thunk.bx>
 689:	81 c3 47 19 00 00    	add    ebx,0x1947
 68f:	83 ec 0c             	sub    esp,0xc
 692:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 696:	8d b3 04 ff ff ff    	lea    esi,[ebx-0xfc]
 69c:	e8 67 fd ff ff       	call   408 <_init>
 6a1:	8d 83 00 ff ff ff    	lea    eax,[ebx-0x100]
 6a7:	29 c6                	sub    esi,eax
 6a9:	c1 fe 02             	sar    esi,0x2
 6ac:	85 f6                	test   esi,esi
 6ae:	74 25                	je     6d5 <__libc_csu_init+0x55>
 6b0:	31 ff                	xor    edi,edi
 6b2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 6b8:	83 ec 04             	sub    esp,0x4
 6bb:	55                   	push   ebp
 6bc:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 6c0:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 6c4:	ff 94 bb 00 ff ff ff 	call   DWORD PTR [ebx+edi*4-0x100]
 6cb:	83 c7 01             	add    edi,0x1
 6ce:	83 c4 10             	add    esp,0x10
 6d1:	39 fe                	cmp    esi,edi
 6d3:	75 e3                	jne    6b8 <__libc_csu_init+0x38>
 6d5:	83 c4 0c             	add    esp,0xc
 6d8:	5b                   	pop    ebx
 6d9:	5e                   	pop    esi
 6da:	5f                   	pop    edi
 6db:	5d                   	pop    ebp
 6dc:	c3                   	ret    
 6dd:	8d 76 00             	lea    esi,[esi+0x0]

000006e0 <__libc_csu_fini>:
 6e0:	f3 c3                	repz ret 
 6e2:	66 90                	xchg   ax,ax
 6e4:	66 90                	xchg   ax,ax
 6e6:	66 90                	xchg   ax,ax
 6e8:	66 90                	xchg   ax,ax
 6ea:	66 90                	xchg   ax,ax
 6ec:	66 90                	xchg   ax,ax
 6ee:	66 90                	xchg   ax,ax

000006f0 <__stack_chk_fail_local>:
 6f0:	53                   	push   ebx
 6f1:	e8 8a fe ff ff       	call   580 <__x86.get_pc_thunk.bx>
 6f6:	81 c3 da 18 00 00    	add    ebx,0x18da
 6fc:	83 ec 08             	sub    esp,0x8
 6ff:	e8 4c fd ff ff       	call   450 <__stack_chk_fail@plt>

Disassembly of section .fini:

00000704 <_fini>:
 704:	53                   	push   ebx
 705:	83 ec 08             	sub    esp,0x8
 708:	e8 73 fe ff ff       	call   580 <__x86.get_pc_thunk.bx>
 70d:	81 c3 c3 18 00 00    	add    ebx,0x18c3
 713:	83 c4 08             	add    esp,0x8
 716:	5b                   	pop    ebx
 717:	c3                   	ret    
