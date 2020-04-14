
bin_code/mul-div:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	4f450513          	addi	a0,a0,1268 # 104f4 <__libc_fini_array>
   100c0:	a1a5                	j	10528 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	d3418193          	addi	gp,gp,-716 # 11df8 <__global_pointer$>
   100cc:	f8818513          	addi	a0,gp,-120 # 11d80 <_edata>
   100d0:	fc018613          	addi	a2,gp,-64 # 11db8 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	2b0000ef          	jal	ra,10388 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	44c50513          	addi	a0,a0,1100 # 10528 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	40e50513          	addi	a0,a0,1038 # 104f4 <__libc_fini_array>
   100ee:	43a000ef          	jal	ra,10528 <atexit>
   100f2:	22c000ef          	jal	ra,1031e <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	05c000ef          	jal	ra,10158 <main>
   10100:	a401                	j	10300 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f881c703          	lbu	a4,-120(gp) # 11d80 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	5dc50513          	addi	a0,a0,1500 # 115dc <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f8f18423          	sb	a5,-120(gp) # 11d80 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f9018593          	addi	a1,gp,-112 # 11d88 <object.5532>
   10148:	5dc50513          	addi	a0,a0,1500 # 115dc <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <main>:
   10158:	fe010113          	addi	sp,sp,-32
   1015c:	00113c23          	sd	ra,24(sp)
   10160:	00813823          	sd	s0,16(sp)
   10164:	02010413          	addi	s0,sp,32
   10168:	fe042623          	sw	zero,-20(s0)
   1016c:	fe042623          	sw	zero,-20(s0)
   10170:	0540006f          	j	101c4 <main+0x6c>
   10174:	000117b7          	lui	a5,0x11
   10178:	5f878713          	addi	a4,a5,1528 # 115f8 <__fini_array_end>
   1017c:	fec42783          	lw	a5,-20(s0)
   10180:	00279793          	slli	a5,a5,0x2
   10184:	00f707b3          	add	a5,a4,a5
   10188:	0007a783          	lw	a5,0(a5)
   1018c:	00078713          	mv	a4,a5
   10190:	00070793          	mv	a5,a4
   10194:	0027979b          	slliw	a5,a5,0x2
   10198:	00e787bb          	addw	a5,a5,a4
   1019c:	0007871b          	sext.w	a4,a5
   101a0:	000117b7          	lui	a5,0x11
   101a4:	5f878693          	addi	a3,a5,1528 # 115f8 <__fini_array_end>
   101a8:	fec42783          	lw	a5,-20(s0)
   101ac:	00279793          	slli	a5,a5,0x2
   101b0:	00f687b3          	add	a5,a3,a5
   101b4:	00e7a023          	sw	a4,0(a5)
   101b8:	fec42783          	lw	a5,-20(s0)
   101bc:	0017879b          	addiw	a5,a5,1
   101c0:	fef42623          	sw	a5,-20(s0)
   101c4:	fec42783          	lw	a5,-20(s0)
   101c8:	0007871b          	sext.w	a4,a5
   101cc:	00400793          	li	a5,4
   101d0:	fae7d2e3          	bge	a5,a4,10174 <main+0x1c>
   101d4:	00500793          	li	a5,5
   101d8:	fef42623          	sw	a5,-20(s0)
   101dc:	0500006f          	j	1022c <main+0xd4>
   101e0:	000117b7          	lui	a5,0x11
   101e4:	5f878713          	addi	a4,a5,1528 # 115f8 <__fini_array_end>
   101e8:	fec42783          	lw	a5,-20(s0)
   101ec:	00279793          	slli	a5,a5,0x2
   101f0:	00f707b3          	add	a5,a4,a5
   101f4:	0007a783          	lw	a5,0(a5)
   101f8:	01f7d71b          	srliw	a4,a5,0x1f
   101fc:	00f707bb          	addw	a5,a4,a5
   10200:	4017d79b          	sraiw	a5,a5,0x1
   10204:	0007871b          	sext.w	a4,a5
   10208:	000117b7          	lui	a5,0x11
   1020c:	5f878693          	addi	a3,a5,1528 # 115f8 <__fini_array_end>
   10210:	fec42783          	lw	a5,-20(s0)
   10214:	00279793          	slli	a5,a5,0x2
   10218:	00f687b3          	add	a5,a3,a5
   1021c:	00e7a023          	sw	a4,0(a5)
   10220:	fec42783          	lw	a5,-20(s0)
   10224:	0017879b          	addiw	a5,a5,1
   10228:	fef42623          	sw	a5,-20(s0)
   1022c:	fec42783          	lw	a5,-20(s0)
   10230:	0007871b          	sext.w	a4,a5
   10234:	00900793          	li	a5,9
   10238:	fae7d4e3          	bge	a5,a4,101e0 <main+0x88>
   1023c:	fe042623          	sw	zero,-20(s0)
   10240:	0380006f          	j	10278 <main+0x120>
   10244:	000117b7          	lui	a5,0x11
   10248:	5f878713          	addi	a4,a5,1528 # 115f8 <__fini_array_end>
   1024c:	fec42783          	lw	a5,-20(s0)
   10250:	00279793          	slli	a5,a5,0x2
   10254:	00f707b3          	add	a5,a4,a5
   10258:	0007a783          	lw	a5,0(a5)
   1025c:	00078513          	mv	a0,a5
   10260:	048000ef          	jal	ra,102a8 <PrintInt>
   10264:	02000513          	li	a0,32
   10268:	06c000ef          	jal	ra,102d4 <PrintChar>
   1026c:	fec42783          	lw	a5,-20(s0)
   10270:	0017879b          	addiw	a5,a5,1
   10274:	fef42623          	sw	a5,-20(s0)
   10278:	fec42783          	lw	a5,-20(s0)
   1027c:	0007871b          	sext.w	a4,a5
   10280:	00900793          	li	a5,9
   10284:	fce7d0e3          	bge	a5,a4,10244 <main+0xec>
   10288:	00a00513          	li	a0,10
   1028c:	048000ef          	jal	ra,102d4 <PrintChar>
   10290:	00000793          	li	a5,0
   10294:	00078513          	mv	a0,a5
   10298:	01813083          	ld	ra,24(sp)
   1029c:	01013403          	ld	s0,16(sp)
   102a0:	02010113          	addi	sp,sp,32
   102a4:	00008067          	ret

00000000000102a8 <PrintInt>:
   102a8:	fe010113          	addi	sp,sp,-32
   102ac:	00813c23          	sd	s0,24(sp)
   102b0:	02010413          	addi	s0,sp,32
   102b4:	00050793          	mv	a5,a0
   102b8:	fef42623          	sw	a5,-20(s0)
   102bc:	00000893          	li	a7,0
   102c0:	00000073          	ecall
   102c4:	00000013          	nop
   102c8:	01813403          	ld	s0,24(sp)
   102cc:	02010113          	addi	sp,sp,32
   102d0:	00008067          	ret

00000000000102d4 <PrintChar>:
   102d4:	fe010113          	addi	sp,sp,-32
   102d8:	00813c23          	sd	s0,24(sp)
   102dc:	02010413          	addi	s0,sp,32
   102e0:	00050793          	mv	a5,a0
   102e4:	fef407a3          	sb	a5,-17(s0)
   102e8:	00100893          	li	a7,1
   102ec:	00000073          	ecall
   102f0:	00000013          	nop
   102f4:	01813403          	ld	s0,24(sp)
   102f8:	02010113          	addi	sp,sp,32
   102fc:	00008067          	ret

0000000000010300 <exit>:
   10300:	1141                	addi	sp,sp,-16
   10302:	4581                	li	a1,0
   10304:	e022                	sd	s0,0(sp)
   10306:	e406                	sd	ra,8(sp)
   10308:	842a                	mv	s0,a0
   1030a:	128000ef          	jal	ra,10432 <__call_exitprocs>
   1030e:	f701b503          	ld	a0,-144(gp) # 11d68 <_global_impure_ptr>
   10312:	6d3c                	ld	a5,88(a0)
   10314:	c391                	beqz	a5,10318 <exit+0x18>
   10316:	9782                	jalr	a5
   10318:	8522                	mv	a0,s0
   1031a:	28e000ef          	jal	ra,105a8 <_exit>

000000000001031e <__libc_init_array>:
   1031e:	1101                	addi	sp,sp,-32
   10320:	e822                	sd	s0,16(sp)
   10322:	e04a                	sd	s2,0(sp)
   10324:	6445                	lui	s0,0x11
   10326:	6945                	lui	s2,0x11
   10328:	5e040793          	addi	a5,s0,1504 # 115e0 <__init_array_start>
   1032c:	5e090913          	addi	s2,s2,1504 # 115e0 <__init_array_start>
   10330:	40f90933          	sub	s2,s2,a5
   10334:	ec06                	sd	ra,24(sp)
   10336:	e426                	sd	s1,8(sp)
   10338:	40395913          	srai	s2,s2,0x3
   1033c:	00090b63          	beqz	s2,10352 <__libc_init_array+0x34>
   10340:	5e040413          	addi	s0,s0,1504
   10344:	4481                	li	s1,0
   10346:	601c                	ld	a5,0(s0)
   10348:	0485                	addi	s1,s1,1
   1034a:	0421                	addi	s0,s0,8
   1034c:	9782                	jalr	a5
   1034e:	fe991ce3          	bne	s2,s1,10346 <__libc_init_array+0x28>
   10352:	6445                	lui	s0,0x11
   10354:	6945                	lui	s2,0x11
   10356:	5e040793          	addi	a5,s0,1504 # 115e0 <__init_array_start>
   1035a:	5f090913          	addi	s2,s2,1520 # 115f0 <__init_array_end>
   1035e:	40f90933          	sub	s2,s2,a5
   10362:	40395913          	srai	s2,s2,0x3
   10366:	00090b63          	beqz	s2,1037c <__libc_init_array+0x5e>
   1036a:	5e040413          	addi	s0,s0,1504
   1036e:	4481                	li	s1,0
   10370:	601c                	ld	a5,0(s0)
   10372:	0485                	addi	s1,s1,1
   10374:	0421                	addi	s0,s0,8
   10376:	9782                	jalr	a5
   10378:	fe991ce3          	bne	s2,s1,10370 <__libc_init_array+0x52>
   1037c:	60e2                	ld	ra,24(sp)
   1037e:	6442                	ld	s0,16(sp)
   10380:	64a2                	ld	s1,8(sp)
   10382:	6902                	ld	s2,0(sp)
   10384:	6105                	addi	sp,sp,32
   10386:	8082                	ret

0000000000010388 <memset>:
   10388:	433d                	li	t1,15
   1038a:	872a                	mv	a4,a0
   1038c:	02c37163          	bgeu	t1,a2,103ae <memset+0x26>
   10390:	00f77793          	andi	a5,a4,15
   10394:	e3c1                	bnez	a5,10414 <memset+0x8c>
   10396:	e1bd                	bnez	a1,103fc <memset+0x74>
   10398:	ff067693          	andi	a3,a2,-16
   1039c:	8a3d                	andi	a2,a2,15
   1039e:	96ba                	add	a3,a3,a4
   103a0:	e30c                	sd	a1,0(a4)
   103a2:	e70c                	sd	a1,8(a4)
   103a4:	0741                	addi	a4,a4,16
   103a6:	fed76de3          	bltu	a4,a3,103a0 <memset+0x18>
   103aa:	e211                	bnez	a2,103ae <memset+0x26>
   103ac:	8082                	ret
   103ae:	40c306b3          	sub	a3,t1,a2
   103b2:	068a                	slli	a3,a3,0x2
   103b4:	00000297          	auipc	t0,0x0
   103b8:	9696                	add	a3,a3,t0
   103ba:	00a68067          	jr	10(a3)
   103be:	00b70723          	sb	a1,14(a4)
   103c2:	00b706a3          	sb	a1,13(a4)
   103c6:	00b70623          	sb	a1,12(a4)
   103ca:	00b705a3          	sb	a1,11(a4)
   103ce:	00b70523          	sb	a1,10(a4)
   103d2:	00b704a3          	sb	a1,9(a4)
   103d6:	00b70423          	sb	a1,8(a4)
   103da:	00b703a3          	sb	a1,7(a4)
   103de:	00b70323          	sb	a1,6(a4)
   103e2:	00b702a3          	sb	a1,5(a4)
   103e6:	00b70223          	sb	a1,4(a4)
   103ea:	00b701a3          	sb	a1,3(a4)
   103ee:	00b70123          	sb	a1,2(a4)
   103f2:	00b700a3          	sb	a1,1(a4)
   103f6:	00b70023          	sb	a1,0(a4)
   103fa:	8082                	ret
   103fc:	0ff5f593          	andi	a1,a1,255
   10400:	00859693          	slli	a3,a1,0x8
   10404:	8dd5                	or	a1,a1,a3
   10406:	01059693          	slli	a3,a1,0x10
   1040a:	8dd5                	or	a1,a1,a3
   1040c:	02059693          	slli	a3,a1,0x20
   10410:	8dd5                	or	a1,a1,a3
   10412:	b759                	j	10398 <memset+0x10>
   10414:	00279693          	slli	a3,a5,0x2
   10418:	00000297          	auipc	t0,0x0
   1041c:	9696                	add	a3,a3,t0
   1041e:	8286                	mv	t0,ra
   10420:	fa2680e7          	jalr	-94(a3)
   10424:	8096                	mv	ra,t0
   10426:	17c1                	addi	a5,a5,-16
   10428:	8f1d                	sub	a4,a4,a5
   1042a:	963e                	add	a2,a2,a5
   1042c:	f8c371e3          	bgeu	t1,a2,103ae <memset+0x26>
   10430:	b79d                	j	10396 <memset+0xe>

0000000000010432 <__call_exitprocs>:
   10432:	715d                	addi	sp,sp,-80
   10434:	f052                	sd	s4,32(sp)
   10436:	f701ba03          	ld	s4,-144(gp) # 11d68 <_global_impure_ptr>
   1043a:	f84a                	sd	s2,48(sp)
   1043c:	e486                	sd	ra,72(sp)
   1043e:	1f8a3903          	ld	s2,504(s4)
   10442:	e0a2                	sd	s0,64(sp)
   10444:	fc26                	sd	s1,56(sp)
   10446:	f44e                	sd	s3,40(sp)
   10448:	ec56                	sd	s5,24(sp)
   1044a:	e85a                	sd	s6,16(sp)
   1044c:	e45e                	sd	s7,8(sp)
   1044e:	e062                	sd	s8,0(sp)
   10450:	02090863          	beqz	s2,10480 <__call_exitprocs+0x4e>
   10454:	8b2a                	mv	s6,a0
   10456:	8bae                	mv	s7,a1
   10458:	4a85                	li	s5,1
   1045a:	59fd                	li	s3,-1
   1045c:	00892483          	lw	s1,8(s2)
   10460:	fff4841b          	addiw	s0,s1,-1
   10464:	00044e63          	bltz	s0,10480 <__call_exitprocs+0x4e>
   10468:	048e                	slli	s1,s1,0x3
   1046a:	94ca                	add	s1,s1,s2
   1046c:	020b8663          	beqz	s7,10498 <__call_exitprocs+0x66>
   10470:	2084b783          	ld	a5,520(s1)
   10474:	03778263          	beq	a5,s7,10498 <__call_exitprocs+0x66>
   10478:	347d                	addiw	s0,s0,-1
   1047a:	14e1                	addi	s1,s1,-8
   1047c:	ff3418e3          	bne	s0,s3,1046c <__call_exitprocs+0x3a>
   10480:	60a6                	ld	ra,72(sp)
   10482:	6406                	ld	s0,64(sp)
   10484:	74e2                	ld	s1,56(sp)
   10486:	7942                	ld	s2,48(sp)
   10488:	79a2                	ld	s3,40(sp)
   1048a:	7a02                	ld	s4,32(sp)
   1048c:	6ae2                	ld	s5,24(sp)
   1048e:	6b42                	ld	s6,16(sp)
   10490:	6ba2                	ld	s7,8(sp)
   10492:	6c02                	ld	s8,0(sp)
   10494:	6161                	addi	sp,sp,80
   10496:	8082                	ret
   10498:	00892783          	lw	a5,8(s2)
   1049c:	6498                	ld	a4,8(s1)
   1049e:	37fd                	addiw	a5,a5,-1
   104a0:	04878463          	beq	a5,s0,104e8 <__call_exitprocs+0xb6>
   104a4:	0004b423          	sd	zero,8(s1)
   104a8:	db61                	beqz	a4,10478 <__call_exitprocs+0x46>
   104aa:	31092783          	lw	a5,784(s2)
   104ae:	008a96bb          	sllw	a3,s5,s0
   104b2:	00892c03          	lw	s8,8(s2)
   104b6:	8ff5                	and	a5,a5,a3
   104b8:	2781                	sext.w	a5,a5
   104ba:	ef89                	bnez	a5,104d4 <__call_exitprocs+0xa2>
   104bc:	9702                	jalr	a4
   104be:	00892703          	lw	a4,8(s2)
   104c2:	1f8a3783          	ld	a5,504(s4)
   104c6:	01871463          	bne	a4,s8,104ce <__call_exitprocs+0x9c>
   104ca:	faf907e3          	beq	s2,a5,10478 <__call_exitprocs+0x46>
   104ce:	dbcd                	beqz	a5,10480 <__call_exitprocs+0x4e>
   104d0:	893e                	mv	s2,a5
   104d2:	b769                	j	1045c <__call_exitprocs+0x2a>
   104d4:	31492783          	lw	a5,788(s2)
   104d8:	1084b583          	ld	a1,264(s1)
   104dc:	8ff5                	and	a5,a5,a3
   104de:	2781                	sext.w	a5,a5
   104e0:	e799                	bnez	a5,104ee <__call_exitprocs+0xbc>
   104e2:	855a                	mv	a0,s6
   104e4:	9702                	jalr	a4
   104e6:	bfe1                	j	104be <__call_exitprocs+0x8c>
   104e8:	00892423          	sw	s0,8(s2)
   104ec:	bf75                	j	104a8 <__call_exitprocs+0x76>
   104ee:	852e                	mv	a0,a1
   104f0:	9702                	jalr	a4
   104f2:	b7f1                	j	104be <__call_exitprocs+0x8c>

00000000000104f4 <__libc_fini_array>:
   104f4:	1101                	addi	sp,sp,-32
   104f6:	e822                	sd	s0,16(sp)
   104f8:	67c5                	lui	a5,0x11
   104fa:	6445                	lui	s0,0x11
   104fc:	5f040413          	addi	s0,s0,1520 # 115f0 <__init_array_end>
   10500:	5f878793          	addi	a5,a5,1528 # 115f8 <__fini_array_end>
   10504:	8f81                	sub	a5,a5,s0
   10506:	e426                	sd	s1,8(sp)
   10508:	ec06                	sd	ra,24(sp)
   1050a:	4037d493          	srai	s1,a5,0x3
   1050e:	c881                	beqz	s1,1051e <__libc_fini_array+0x2a>
   10510:	17e1                	addi	a5,a5,-8
   10512:	943e                	add	s0,s0,a5
   10514:	601c                	ld	a5,0(s0)
   10516:	14fd                	addi	s1,s1,-1
   10518:	1461                	addi	s0,s0,-8
   1051a:	9782                	jalr	a5
   1051c:	fce5                	bnez	s1,10514 <__libc_fini_array+0x20>
   1051e:	60e2                	ld	ra,24(sp)
   10520:	6442                	ld	s0,16(sp)
   10522:	64a2                	ld	s1,8(sp)
   10524:	6105                	addi	sp,sp,32
   10526:	8082                	ret

0000000000010528 <atexit>:
   10528:	85aa                	mv	a1,a0
   1052a:	4681                	li	a3,0
   1052c:	4601                	li	a2,0
   1052e:	4501                	li	a0,0
   10530:	a009                	j	10532 <__register_exitproc>

0000000000010532 <__register_exitproc>:
   10532:	f701b703          	ld	a4,-144(gp) # 11d68 <_global_impure_ptr>
   10536:	1f873783          	ld	a5,504(a4)
   1053a:	c3b1                	beqz	a5,1057e <__register_exitproc+0x4c>
   1053c:	4798                	lw	a4,8(a5)
   1053e:	487d                	li	a6,31
   10540:	06e84263          	blt	a6,a4,105a4 <__register_exitproc+0x72>
   10544:	c505                	beqz	a0,1056c <__register_exitproc+0x3a>
   10546:	00371813          	slli	a6,a4,0x3
   1054a:	983e                	add	a6,a6,a5
   1054c:	10c83823          	sd	a2,272(a6)
   10550:	3107a883          	lw	a7,784(a5)
   10554:	4605                	li	a2,1
   10556:	00e6163b          	sllw	a2,a2,a4
   1055a:	00c8e8b3          	or	a7,a7,a2
   1055e:	3117a823          	sw	a7,784(a5)
   10562:	20d83823          	sd	a3,528(a6)
   10566:	4689                	li	a3,2
   10568:	02d50063          	beq	a0,a3,10588 <__register_exitproc+0x56>
   1056c:	00270693          	addi	a3,a4,2
   10570:	068e                	slli	a3,a3,0x3
   10572:	2705                	addiw	a4,a4,1
   10574:	c798                	sw	a4,8(a5)
   10576:	97b6                	add	a5,a5,a3
   10578:	e38c                	sd	a1,0(a5)
   1057a:	4501                	li	a0,0
   1057c:	8082                	ret
   1057e:	20070793          	addi	a5,a4,512
   10582:	1ef73c23          	sd	a5,504(a4)
   10586:	bf5d                	j	1053c <__register_exitproc+0xa>
   10588:	3147a683          	lw	a3,788(a5)
   1058c:	4501                	li	a0,0
   1058e:	8e55                	or	a2,a2,a3
   10590:	00270693          	addi	a3,a4,2
   10594:	068e                	slli	a3,a3,0x3
   10596:	2705                	addiw	a4,a4,1
   10598:	30c7aa23          	sw	a2,788(a5)
   1059c:	c798                	sw	a4,8(a5)
   1059e:	97b6                	add	a5,a5,a3
   105a0:	e38c                	sd	a1,0(a5)
   105a2:	8082                	ret
   105a4:	557d                	li	a0,-1
   105a6:	8082                	ret

00000000000105a8 <_exit>:
   105a8:	4581                	li	a1,0
   105aa:	4601                	li	a2,0
   105ac:	4681                	li	a3,0
   105ae:	4701                	li	a4,0
   105b0:	4781                	li	a5,0
   105b2:	05d00893          	li	a7,93
   105b6:	00000073          	ecall
   105ba:	00054363          	bltz	a0,105c0 <_exit+0x18>
   105be:	a001                	j	105be <_exit+0x16>
   105c0:	1141                	addi	sp,sp,-16
   105c2:	e022                	sd	s0,0(sp)
   105c4:	842a                	mv	s0,a0
   105c6:	e406                	sd	ra,8(sp)
   105c8:	4080043b          	negw	s0,s0
   105cc:	008000ef          	jal	ra,105d4 <__errno>
   105d0:	c100                	sw	s0,0(a0)
   105d2:	a001                	j	105d2 <_exit+0x2a>

00000000000105d4 <__errno>:
   105d4:	f801b503          	ld	a0,-128(gp) # 11d78 <_impure_ptr>
   105d8:	8082                	ret
