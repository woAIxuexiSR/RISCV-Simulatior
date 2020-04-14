
bin_code/simple-function:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	50450513          	addi	a0,a0,1284 # 10504 <__libc_fini_array>
   100c0:	a9a5                	j	10538 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	d4418193          	addi	gp,gp,-700 # 11e08 <__global_pointer$>
   100cc:	f8818513          	addi	a0,gp,-120 # 11d90 <_edata>
   100d0:	fc018613          	addi	a2,gp,-64 # 11dc8 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	2c0000ef          	jal	ra,10398 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	45c50513          	addi	a0,a0,1116 # 10538 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	41e50513          	addi	a0,a0,1054 # 10504 <__libc_fini_array>
   100ee:	44a000ef          	jal	ra,10538 <atexit>
   100f2:	23c000ef          	jal	ra,1032e <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	13c000ef          	jal	ra,10238 <main>
   10100:	ac01                	j	10310 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f881c703          	lbu	a4,-120(gp) # 11d90 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	5ec50513          	addi	a0,a0,1516 # 115ec <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f8f18423          	sb	a5,-120(gp) # 11d90 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f9018593          	addi	a1,gp,-112 # 11d98 <object.5532>
   10148:	5ec50513          	addi	a0,a0,1516 # 115ec <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <fuction>:
   10158:	fe010113          	addi	sp,sp,-32
   1015c:	00813c23          	sd	s0,24(sp)
   10160:	02010413          	addi	s0,sp,32
   10164:	fe042623          	sw	zero,-20(s0)
   10168:	fe042623          	sw	zero,-20(s0)
   1016c:	0480006f          	j	101b4 <fuction+0x5c>
   10170:	000117b7          	lui	a5,0x11
   10174:	60878713          	addi	a4,a5,1544 # 11608 <__fini_array_end>
   10178:	fec42783          	lw	a5,-20(s0)
   1017c:	00279793          	slli	a5,a5,0x2
   10180:	00f707b3          	add	a5,a4,a5
   10184:	0007a783          	lw	a5,0(a5)
   10188:	00a7879b          	addiw	a5,a5,10
   1018c:	0007871b          	sext.w	a4,a5
   10190:	000117b7          	lui	a5,0x11
   10194:	60878693          	addi	a3,a5,1544 # 11608 <__fini_array_end>
   10198:	fec42783          	lw	a5,-20(s0)
   1019c:	00279793          	slli	a5,a5,0x2
   101a0:	00f687b3          	add	a5,a3,a5
   101a4:	00e7a023          	sw	a4,0(a5)
   101a8:	fec42783          	lw	a5,-20(s0)
   101ac:	0017879b          	addiw	a5,a5,1
   101b0:	fef42623          	sw	a5,-20(s0)
   101b4:	fec42783          	lw	a5,-20(s0)
   101b8:	0007871b          	sext.w	a4,a5
   101bc:	00400793          	li	a5,4
   101c0:	fae7d8e3          	bge	a5,a4,10170 <fuction+0x18>
   101c4:	00500793          	li	a5,5
   101c8:	fef42623          	sw	a5,-20(s0)
   101cc:	0480006f          	j	10214 <fuction+0xbc>
   101d0:	000117b7          	lui	a5,0x11
   101d4:	60878713          	addi	a4,a5,1544 # 11608 <__fini_array_end>
   101d8:	fec42783          	lw	a5,-20(s0)
   101dc:	00279793          	slli	a5,a5,0x2
   101e0:	00f707b3          	add	a5,a4,a5
   101e4:	0007a783          	lw	a5,0(a5)
   101e8:	ffb7879b          	addiw	a5,a5,-5
   101ec:	0007871b          	sext.w	a4,a5
   101f0:	000117b7          	lui	a5,0x11
   101f4:	60878693          	addi	a3,a5,1544 # 11608 <__fini_array_end>
   101f8:	fec42783          	lw	a5,-20(s0)
   101fc:	00279793          	slli	a5,a5,0x2
   10200:	00f687b3          	add	a5,a3,a5
   10204:	00e7a023          	sw	a4,0(a5)
   10208:	fec42783          	lw	a5,-20(s0)
   1020c:	0017879b          	addiw	a5,a5,1
   10210:	fef42623          	sw	a5,-20(s0)
   10214:	fec42783          	lw	a5,-20(s0)
   10218:	0007871b          	sext.w	a4,a5
   1021c:	00900793          	li	a5,9
   10220:	fae7d8e3          	bge	a5,a4,101d0 <fuction+0x78>
   10224:	00000013          	nop
   10228:	00000013          	nop
   1022c:	01813403          	ld	s0,24(sp)
   10230:	02010113          	addi	sp,sp,32
   10234:	00008067          	ret

0000000000010238 <main>:
   10238:	fe010113          	addi	sp,sp,-32
   1023c:	00113c23          	sd	ra,24(sp)
   10240:	00813823          	sd	s0,16(sp)
   10244:	02010413          	addi	s0,sp,32
   10248:	f11ff0ef          	jal	ra,10158 <fuction>
   1024c:	fe042623          	sw	zero,-20(s0)
   10250:	0380006f          	j	10288 <main+0x50>
   10254:	000117b7          	lui	a5,0x11
   10258:	60878713          	addi	a4,a5,1544 # 11608 <__fini_array_end>
   1025c:	fec42783          	lw	a5,-20(s0)
   10260:	00279793          	slli	a5,a5,0x2
   10264:	00f707b3          	add	a5,a4,a5
   10268:	0007a783          	lw	a5,0(a5)
   1026c:	00078513          	mv	a0,a5
   10270:	048000ef          	jal	ra,102b8 <PrintInt>
   10274:	02000513          	li	a0,32
   10278:	06c000ef          	jal	ra,102e4 <PrintChar>
   1027c:	fec42783          	lw	a5,-20(s0)
   10280:	0017879b          	addiw	a5,a5,1
   10284:	fef42623          	sw	a5,-20(s0)
   10288:	fec42783          	lw	a5,-20(s0)
   1028c:	0007871b          	sext.w	a4,a5
   10290:	00900793          	li	a5,9
   10294:	fce7d0e3          	bge	a5,a4,10254 <main+0x1c>
   10298:	00a00513          	li	a0,10
   1029c:	048000ef          	jal	ra,102e4 <PrintChar>
   102a0:	00000793          	li	a5,0
   102a4:	00078513          	mv	a0,a5
   102a8:	01813083          	ld	ra,24(sp)
   102ac:	01013403          	ld	s0,16(sp)
   102b0:	02010113          	addi	sp,sp,32
   102b4:	00008067          	ret

00000000000102b8 <PrintInt>:
   102b8:	fe010113          	addi	sp,sp,-32
   102bc:	00813c23          	sd	s0,24(sp)
   102c0:	02010413          	addi	s0,sp,32
   102c4:	00050793          	mv	a5,a0
   102c8:	fef42623          	sw	a5,-20(s0)
   102cc:	00000893          	li	a7,0
   102d0:	00000073          	ecall
   102d4:	00000013          	nop
   102d8:	01813403          	ld	s0,24(sp)
   102dc:	02010113          	addi	sp,sp,32
   102e0:	00008067          	ret

00000000000102e4 <PrintChar>:
   102e4:	fe010113          	addi	sp,sp,-32
   102e8:	00813c23          	sd	s0,24(sp)
   102ec:	02010413          	addi	s0,sp,32
   102f0:	00050793          	mv	a5,a0
   102f4:	fef407a3          	sb	a5,-17(s0)
   102f8:	00100893          	li	a7,1
   102fc:	00000073          	ecall
   10300:	00000013          	nop
   10304:	01813403          	ld	s0,24(sp)
   10308:	02010113          	addi	sp,sp,32
   1030c:	00008067          	ret

0000000000010310 <exit>:
   10310:	1141                	addi	sp,sp,-16
   10312:	4581                	li	a1,0
   10314:	e022                	sd	s0,0(sp)
   10316:	e406                	sd	ra,8(sp)
   10318:	842a                	mv	s0,a0
   1031a:	128000ef          	jal	ra,10442 <__call_exitprocs>
   1031e:	f701b503          	ld	a0,-144(gp) # 11d78 <_global_impure_ptr>
   10322:	6d3c                	ld	a5,88(a0)
   10324:	c391                	beqz	a5,10328 <exit+0x18>
   10326:	9782                	jalr	a5
   10328:	8522                	mv	a0,s0
   1032a:	28e000ef          	jal	ra,105b8 <_exit>

000000000001032e <__libc_init_array>:
   1032e:	1101                	addi	sp,sp,-32
   10330:	e822                	sd	s0,16(sp)
   10332:	e04a                	sd	s2,0(sp)
   10334:	6445                	lui	s0,0x11
   10336:	6945                	lui	s2,0x11
   10338:	5f040793          	addi	a5,s0,1520 # 115f0 <__init_array_start>
   1033c:	5f090913          	addi	s2,s2,1520 # 115f0 <__init_array_start>
   10340:	40f90933          	sub	s2,s2,a5
   10344:	ec06                	sd	ra,24(sp)
   10346:	e426                	sd	s1,8(sp)
   10348:	40395913          	srai	s2,s2,0x3
   1034c:	00090b63          	beqz	s2,10362 <__libc_init_array+0x34>
   10350:	5f040413          	addi	s0,s0,1520
   10354:	4481                	li	s1,0
   10356:	601c                	ld	a5,0(s0)
   10358:	0485                	addi	s1,s1,1
   1035a:	0421                	addi	s0,s0,8
   1035c:	9782                	jalr	a5
   1035e:	fe991ce3          	bne	s2,s1,10356 <__libc_init_array+0x28>
   10362:	6445                	lui	s0,0x11
   10364:	6945                	lui	s2,0x11
   10366:	5f040793          	addi	a5,s0,1520 # 115f0 <__init_array_start>
   1036a:	60090913          	addi	s2,s2,1536 # 11600 <__init_array_end>
   1036e:	40f90933          	sub	s2,s2,a5
   10372:	40395913          	srai	s2,s2,0x3
   10376:	00090b63          	beqz	s2,1038c <__libc_init_array+0x5e>
   1037a:	5f040413          	addi	s0,s0,1520
   1037e:	4481                	li	s1,0
   10380:	601c                	ld	a5,0(s0)
   10382:	0485                	addi	s1,s1,1
   10384:	0421                	addi	s0,s0,8
   10386:	9782                	jalr	a5
   10388:	fe991ce3          	bne	s2,s1,10380 <__libc_init_array+0x52>
   1038c:	60e2                	ld	ra,24(sp)
   1038e:	6442                	ld	s0,16(sp)
   10390:	64a2                	ld	s1,8(sp)
   10392:	6902                	ld	s2,0(sp)
   10394:	6105                	addi	sp,sp,32
   10396:	8082                	ret

0000000000010398 <memset>:
   10398:	433d                	li	t1,15
   1039a:	872a                	mv	a4,a0
   1039c:	02c37163          	bgeu	t1,a2,103be <memset+0x26>
   103a0:	00f77793          	andi	a5,a4,15
   103a4:	e3c1                	bnez	a5,10424 <memset+0x8c>
   103a6:	e1bd                	bnez	a1,1040c <memset+0x74>
   103a8:	ff067693          	andi	a3,a2,-16
   103ac:	8a3d                	andi	a2,a2,15
   103ae:	96ba                	add	a3,a3,a4
   103b0:	e30c                	sd	a1,0(a4)
   103b2:	e70c                	sd	a1,8(a4)
   103b4:	0741                	addi	a4,a4,16
   103b6:	fed76de3          	bltu	a4,a3,103b0 <memset+0x18>
   103ba:	e211                	bnez	a2,103be <memset+0x26>
   103bc:	8082                	ret
   103be:	40c306b3          	sub	a3,t1,a2
   103c2:	068a                	slli	a3,a3,0x2
   103c4:	00000297          	auipc	t0,0x0
   103c8:	9696                	add	a3,a3,t0
   103ca:	00a68067          	jr	10(a3)
   103ce:	00b70723          	sb	a1,14(a4)
   103d2:	00b706a3          	sb	a1,13(a4)
   103d6:	00b70623          	sb	a1,12(a4)
   103da:	00b705a3          	sb	a1,11(a4)
   103de:	00b70523          	sb	a1,10(a4)
   103e2:	00b704a3          	sb	a1,9(a4)
   103e6:	00b70423          	sb	a1,8(a4)
   103ea:	00b703a3          	sb	a1,7(a4)
   103ee:	00b70323          	sb	a1,6(a4)
   103f2:	00b702a3          	sb	a1,5(a4)
   103f6:	00b70223          	sb	a1,4(a4)
   103fa:	00b701a3          	sb	a1,3(a4)
   103fe:	00b70123          	sb	a1,2(a4)
   10402:	00b700a3          	sb	a1,1(a4)
   10406:	00b70023          	sb	a1,0(a4)
   1040a:	8082                	ret
   1040c:	0ff5f593          	andi	a1,a1,255
   10410:	00859693          	slli	a3,a1,0x8
   10414:	8dd5                	or	a1,a1,a3
   10416:	01059693          	slli	a3,a1,0x10
   1041a:	8dd5                	or	a1,a1,a3
   1041c:	02059693          	slli	a3,a1,0x20
   10420:	8dd5                	or	a1,a1,a3
   10422:	b759                	j	103a8 <memset+0x10>
   10424:	00279693          	slli	a3,a5,0x2
   10428:	00000297          	auipc	t0,0x0
   1042c:	9696                	add	a3,a3,t0
   1042e:	8286                	mv	t0,ra
   10430:	fa2680e7          	jalr	-94(a3)
   10434:	8096                	mv	ra,t0
   10436:	17c1                	addi	a5,a5,-16
   10438:	8f1d                	sub	a4,a4,a5
   1043a:	963e                	add	a2,a2,a5
   1043c:	f8c371e3          	bgeu	t1,a2,103be <memset+0x26>
   10440:	b79d                	j	103a6 <memset+0xe>

0000000000010442 <__call_exitprocs>:
   10442:	715d                	addi	sp,sp,-80
   10444:	f052                	sd	s4,32(sp)
   10446:	f701ba03          	ld	s4,-144(gp) # 11d78 <_global_impure_ptr>
   1044a:	f84a                	sd	s2,48(sp)
   1044c:	e486                	sd	ra,72(sp)
   1044e:	1f8a3903          	ld	s2,504(s4)
   10452:	e0a2                	sd	s0,64(sp)
   10454:	fc26                	sd	s1,56(sp)
   10456:	f44e                	sd	s3,40(sp)
   10458:	ec56                	sd	s5,24(sp)
   1045a:	e85a                	sd	s6,16(sp)
   1045c:	e45e                	sd	s7,8(sp)
   1045e:	e062                	sd	s8,0(sp)
   10460:	02090863          	beqz	s2,10490 <__call_exitprocs+0x4e>
   10464:	8b2a                	mv	s6,a0
   10466:	8bae                	mv	s7,a1
   10468:	4a85                	li	s5,1
   1046a:	59fd                	li	s3,-1
   1046c:	00892483          	lw	s1,8(s2)
   10470:	fff4841b          	addiw	s0,s1,-1
   10474:	00044e63          	bltz	s0,10490 <__call_exitprocs+0x4e>
   10478:	048e                	slli	s1,s1,0x3
   1047a:	94ca                	add	s1,s1,s2
   1047c:	020b8663          	beqz	s7,104a8 <__call_exitprocs+0x66>
   10480:	2084b783          	ld	a5,520(s1)
   10484:	03778263          	beq	a5,s7,104a8 <__call_exitprocs+0x66>
   10488:	347d                	addiw	s0,s0,-1
   1048a:	14e1                	addi	s1,s1,-8
   1048c:	ff3418e3          	bne	s0,s3,1047c <__call_exitprocs+0x3a>
   10490:	60a6                	ld	ra,72(sp)
   10492:	6406                	ld	s0,64(sp)
   10494:	74e2                	ld	s1,56(sp)
   10496:	7942                	ld	s2,48(sp)
   10498:	79a2                	ld	s3,40(sp)
   1049a:	7a02                	ld	s4,32(sp)
   1049c:	6ae2                	ld	s5,24(sp)
   1049e:	6b42                	ld	s6,16(sp)
   104a0:	6ba2                	ld	s7,8(sp)
   104a2:	6c02                	ld	s8,0(sp)
   104a4:	6161                	addi	sp,sp,80
   104a6:	8082                	ret
   104a8:	00892783          	lw	a5,8(s2)
   104ac:	6498                	ld	a4,8(s1)
   104ae:	37fd                	addiw	a5,a5,-1
   104b0:	04878463          	beq	a5,s0,104f8 <__call_exitprocs+0xb6>
   104b4:	0004b423          	sd	zero,8(s1)
   104b8:	db61                	beqz	a4,10488 <__call_exitprocs+0x46>
   104ba:	31092783          	lw	a5,784(s2)
   104be:	008a96bb          	sllw	a3,s5,s0
   104c2:	00892c03          	lw	s8,8(s2)
   104c6:	8ff5                	and	a5,a5,a3
   104c8:	2781                	sext.w	a5,a5
   104ca:	ef89                	bnez	a5,104e4 <__call_exitprocs+0xa2>
   104cc:	9702                	jalr	a4
   104ce:	00892703          	lw	a4,8(s2)
   104d2:	1f8a3783          	ld	a5,504(s4)
   104d6:	01871463          	bne	a4,s8,104de <__call_exitprocs+0x9c>
   104da:	faf907e3          	beq	s2,a5,10488 <__call_exitprocs+0x46>
   104de:	dbcd                	beqz	a5,10490 <__call_exitprocs+0x4e>
   104e0:	893e                	mv	s2,a5
   104e2:	b769                	j	1046c <__call_exitprocs+0x2a>
   104e4:	31492783          	lw	a5,788(s2)
   104e8:	1084b583          	ld	a1,264(s1)
   104ec:	8ff5                	and	a5,a5,a3
   104ee:	2781                	sext.w	a5,a5
   104f0:	e799                	bnez	a5,104fe <__call_exitprocs+0xbc>
   104f2:	855a                	mv	a0,s6
   104f4:	9702                	jalr	a4
   104f6:	bfe1                	j	104ce <__call_exitprocs+0x8c>
   104f8:	00892423          	sw	s0,8(s2)
   104fc:	bf75                	j	104b8 <__call_exitprocs+0x76>
   104fe:	852e                	mv	a0,a1
   10500:	9702                	jalr	a4
   10502:	b7f1                	j	104ce <__call_exitprocs+0x8c>

0000000000010504 <__libc_fini_array>:
   10504:	1101                	addi	sp,sp,-32
   10506:	e822                	sd	s0,16(sp)
   10508:	67c5                	lui	a5,0x11
   1050a:	6445                	lui	s0,0x11
   1050c:	60040413          	addi	s0,s0,1536 # 11600 <__init_array_end>
   10510:	60878793          	addi	a5,a5,1544 # 11608 <__fini_array_end>
   10514:	8f81                	sub	a5,a5,s0
   10516:	e426                	sd	s1,8(sp)
   10518:	ec06                	sd	ra,24(sp)
   1051a:	4037d493          	srai	s1,a5,0x3
   1051e:	c881                	beqz	s1,1052e <__libc_fini_array+0x2a>
   10520:	17e1                	addi	a5,a5,-8
   10522:	943e                	add	s0,s0,a5
   10524:	601c                	ld	a5,0(s0)
   10526:	14fd                	addi	s1,s1,-1
   10528:	1461                	addi	s0,s0,-8
   1052a:	9782                	jalr	a5
   1052c:	fce5                	bnez	s1,10524 <__libc_fini_array+0x20>
   1052e:	60e2                	ld	ra,24(sp)
   10530:	6442                	ld	s0,16(sp)
   10532:	64a2                	ld	s1,8(sp)
   10534:	6105                	addi	sp,sp,32
   10536:	8082                	ret

0000000000010538 <atexit>:
   10538:	85aa                	mv	a1,a0
   1053a:	4681                	li	a3,0
   1053c:	4601                	li	a2,0
   1053e:	4501                	li	a0,0
   10540:	a009                	j	10542 <__register_exitproc>

0000000000010542 <__register_exitproc>:
   10542:	f701b703          	ld	a4,-144(gp) # 11d78 <_global_impure_ptr>
   10546:	1f873783          	ld	a5,504(a4)
   1054a:	c3b1                	beqz	a5,1058e <__register_exitproc+0x4c>
   1054c:	4798                	lw	a4,8(a5)
   1054e:	487d                	li	a6,31
   10550:	06e84263          	blt	a6,a4,105b4 <__register_exitproc+0x72>
   10554:	c505                	beqz	a0,1057c <__register_exitproc+0x3a>
   10556:	00371813          	slli	a6,a4,0x3
   1055a:	983e                	add	a6,a6,a5
   1055c:	10c83823          	sd	a2,272(a6)
   10560:	3107a883          	lw	a7,784(a5)
   10564:	4605                	li	a2,1
   10566:	00e6163b          	sllw	a2,a2,a4
   1056a:	00c8e8b3          	or	a7,a7,a2
   1056e:	3117a823          	sw	a7,784(a5)
   10572:	20d83823          	sd	a3,528(a6)
   10576:	4689                	li	a3,2
   10578:	02d50063          	beq	a0,a3,10598 <__register_exitproc+0x56>
   1057c:	00270693          	addi	a3,a4,2
   10580:	068e                	slli	a3,a3,0x3
   10582:	2705                	addiw	a4,a4,1
   10584:	c798                	sw	a4,8(a5)
   10586:	97b6                	add	a5,a5,a3
   10588:	e38c                	sd	a1,0(a5)
   1058a:	4501                	li	a0,0
   1058c:	8082                	ret
   1058e:	20070793          	addi	a5,a4,512
   10592:	1ef73c23          	sd	a5,504(a4)
   10596:	bf5d                	j	1054c <__register_exitproc+0xa>
   10598:	3147a683          	lw	a3,788(a5)
   1059c:	4501                	li	a0,0
   1059e:	8e55                	or	a2,a2,a3
   105a0:	00270693          	addi	a3,a4,2
   105a4:	068e                	slli	a3,a3,0x3
   105a6:	2705                	addiw	a4,a4,1
   105a8:	30c7aa23          	sw	a2,788(a5)
   105ac:	c798                	sw	a4,8(a5)
   105ae:	97b6                	add	a5,a5,a3
   105b0:	e38c                	sd	a1,0(a5)
   105b2:	8082                	ret
   105b4:	557d                	li	a0,-1
   105b6:	8082                	ret

00000000000105b8 <_exit>:
   105b8:	4581                	li	a1,0
   105ba:	4601                	li	a2,0
   105bc:	4681                	li	a3,0
   105be:	4701                	li	a4,0
   105c0:	4781                	li	a5,0
   105c2:	05d00893          	li	a7,93
   105c6:	00000073          	ecall
   105ca:	00054363          	bltz	a0,105d0 <_exit+0x18>
   105ce:	a001                	j	105ce <_exit+0x16>
   105d0:	1141                	addi	sp,sp,-16
   105d2:	e022                	sd	s0,0(sp)
   105d4:	842a                	mv	s0,a0
   105d6:	e406                	sd	ra,8(sp)
   105d8:	4080043b          	negw	s0,s0
   105dc:	008000ef          	jal	ra,105e4 <__errno>
   105e0:	c100                	sw	s0,0(a0)
   105e2:	a001                	j	105e2 <_exit+0x2a>

00000000000105e4 <__errno>:
   105e4:	f801b503          	ld	a0,-128(gp) # 11d88 <_impure_ptr>
   105e8:	8082                	ret
