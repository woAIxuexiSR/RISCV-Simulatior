
bin_code/mat-mul:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	5a450513          	addi	a0,a0,1444 # 105a4 <__libc_fini_array>
   100c0:	ab21                	j	105d8 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	de418193          	addi	gp,gp,-540 # 11ea8 <__global_pointer$>
   100cc:	03018513          	addi	a0,gp,48 # 11ed8 <_edata>
   100d0:	0d018613          	addi	a2,gp,208 # 11f78 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	360000ef          	jal	ra,10438 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	4fc50513          	addi	a0,a0,1276 # 105d8 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	4be50513          	addi	a0,a0,1214 # 105a4 <__libc_fini_array>
   100ee:	4ea000ef          	jal	ra,105d8 <atexit>
   100f2:	2dc000ef          	jal	ra,103ce <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	05c000ef          	jal	ra,10158 <main>
   10100:	ac45                	j	103b0 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	0301c703          	lbu	a4,48(gp) # 11ed8 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	68c50513          	addi	a0,a0,1676 # 1168c <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	02f18823          	sb	a5,48(gp) # 11ed8 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	03818593          	addi	a1,gp,56 # 11ee0 <object.5532>
   10148:	68c50513          	addi	a0,a0,1676 # 1168c <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <main>:
   10158:	fd010113          	addi	sp,sp,-48
   1015c:	02113423          	sd	ra,40(sp)
   10160:	02813023          	sd	s0,32(sp)
   10164:	03010413          	addi	s0,sp,48
   10168:	fc042c23          	sw	zero,-40(s0)
   1016c:	fe042623          	sw	zero,-20(s0)
   10170:	1380006f          	j	102a8 <main+0x150>
   10174:	fe042423          	sw	zero,-24(s0)
   10178:	1140006f          	j	1028c <main+0x134>
   1017c:	06818693          	addi	a3,gp,104 # 11f10 <c>
   10180:	fe842603          	lw	a2,-24(s0)
   10184:	fec42703          	lw	a4,-20(s0)
   10188:	00070793          	mv	a5,a4
   1018c:	00279793          	slli	a5,a5,0x2
   10190:	00e787b3          	add	a5,a5,a4
   10194:	00c787b3          	add	a5,a5,a2
   10198:	00279793          	slli	a5,a5,0x2
   1019c:	00f687b3          	add	a5,a3,a5
   101a0:	0007a023          	sw	zero,0(a5) # 0 <register_fini-0x100b0>
   101a4:	fe042223          	sw	zero,-28(s0)
   101a8:	0c80006f          	j	10270 <main+0x118>
   101ac:	06818693          	addi	a3,gp,104 # 11f10 <c>
   101b0:	fe842603          	lw	a2,-24(s0)
   101b4:	fec42703          	lw	a4,-20(s0)
   101b8:	00070793          	mv	a5,a4
   101bc:	00279793          	slli	a5,a5,0x2
   101c0:	00e787b3          	add	a5,a5,a4
   101c4:	00c787b3          	add	a5,a5,a2
   101c8:	00279793          	slli	a5,a5,0x2
   101cc:	00f687b3          	add	a5,a3,a5
   101d0:	0007a683          	lw	a3,0(a5)
   101d4:	000117b7          	lui	a5,0x11
   101d8:	6a878613          	addi	a2,a5,1704 # 116a8 <__fini_array_end>
   101dc:	fe442583          	lw	a1,-28(s0)
   101e0:	fec42703          	lw	a4,-20(s0)
   101e4:	00070793          	mv	a5,a4
   101e8:	00279793          	slli	a5,a5,0x2
   101ec:	00e787b3          	add	a5,a5,a4
   101f0:	00b787b3          	add	a5,a5,a1
   101f4:	00279793          	slli	a5,a5,0x2
   101f8:	00f607b3          	add	a5,a2,a5
   101fc:	0007a603          	lw	a2,0(a5)
   10200:	000117b7          	lui	a5,0x11
   10204:	71078593          	addi	a1,a5,1808 # 11710 <b>
   10208:	fe842503          	lw	a0,-24(s0)
   1020c:	fe442703          	lw	a4,-28(s0)
   10210:	00070793          	mv	a5,a4
   10214:	00279793          	slli	a5,a5,0x2
   10218:	00e787b3          	add	a5,a5,a4
   1021c:	00a787b3          	add	a5,a5,a0
   10220:	00279793          	slli	a5,a5,0x2
   10224:	00f587b3          	add	a5,a1,a5
   10228:	0007a783          	lw	a5,0(a5)
   1022c:	02f607bb          	mulw	a5,a2,a5
   10230:	0007879b          	sext.w	a5,a5
   10234:	00f687bb          	addw	a5,a3,a5
   10238:	0007869b          	sext.w	a3,a5
   1023c:	06818613          	addi	a2,gp,104 # 11f10 <c>
   10240:	fe842583          	lw	a1,-24(s0)
   10244:	fec42703          	lw	a4,-20(s0)
   10248:	00070793          	mv	a5,a4
   1024c:	00279793          	slli	a5,a5,0x2
   10250:	00e787b3          	add	a5,a5,a4
   10254:	00b787b3          	add	a5,a5,a1
   10258:	00279793          	slli	a5,a5,0x2
   1025c:	00f607b3          	add	a5,a2,a5
   10260:	00d7a023          	sw	a3,0(a5)
   10264:	fe442783          	lw	a5,-28(s0)
   10268:	0017879b          	addiw	a5,a5,1
   1026c:	fef42223          	sw	a5,-28(s0)
   10270:	fe442783          	lw	a5,-28(s0)
   10274:	0007871b          	sext.w	a4,a5
   10278:	00400793          	li	a5,4
   1027c:	f2e7d8e3          	bge	a5,a4,101ac <main+0x54>
   10280:	fe842783          	lw	a5,-24(s0)
   10284:	0017879b          	addiw	a5,a5,1
   10288:	fef42423          	sw	a5,-24(s0)
   1028c:	fe842783          	lw	a5,-24(s0)
   10290:	0007871b          	sext.w	a4,a5
   10294:	00400793          	li	a5,4
   10298:	eee7d2e3          	bge	a5,a4,1017c <main+0x24>
   1029c:	fec42783          	lw	a5,-20(s0)
   102a0:	0017879b          	addiw	a5,a5,1
   102a4:	fef42623          	sw	a5,-20(s0)
   102a8:	fec42783          	lw	a5,-20(s0)
   102ac:	0007871b          	sext.w	a4,a5
   102b0:	00400793          	li	a5,4
   102b4:	ece7d0e3          	bge	a5,a4,10174 <main+0x1c>
   102b8:	fe042023          	sw	zero,-32(s0)
   102bc:	0740006f          	j	10330 <main+0x1d8>
   102c0:	fc042e23          	sw	zero,-36(s0)
   102c4:	0480006f          	j	1030c <main+0x1b4>
   102c8:	06818693          	addi	a3,gp,104 # 11f10 <c>
   102cc:	fdc42603          	lw	a2,-36(s0)
   102d0:	fe042703          	lw	a4,-32(s0)
   102d4:	00070793          	mv	a5,a4
   102d8:	00279793          	slli	a5,a5,0x2
   102dc:	00e787b3          	add	a5,a5,a4
   102e0:	00c787b3          	add	a5,a5,a2
   102e4:	00279793          	slli	a5,a5,0x2
   102e8:	00f687b3          	add	a5,a3,a5
   102ec:	0007a783          	lw	a5,0(a5)
   102f0:	00078513          	mv	a0,a5
   102f4:	064000ef          	jal	ra,10358 <PrintInt>
   102f8:	02000513          	li	a0,32
   102fc:	088000ef          	jal	ra,10384 <PrintChar>
   10300:	fdc42783          	lw	a5,-36(s0)
   10304:	0017879b          	addiw	a5,a5,1
   10308:	fcf42e23          	sw	a5,-36(s0)
   1030c:	fdc42783          	lw	a5,-36(s0)
   10310:	0007871b          	sext.w	a4,a5
   10314:	00400793          	li	a5,4
   10318:	fae7d8e3          	bge	a5,a4,102c8 <main+0x170>
   1031c:	00a00513          	li	a0,10
   10320:	064000ef          	jal	ra,10384 <PrintChar>
   10324:	fe042783          	lw	a5,-32(s0)
   10328:	0017879b          	addiw	a5,a5,1
   1032c:	fef42023          	sw	a5,-32(s0)
   10330:	fe042783          	lw	a5,-32(s0)
   10334:	0007871b          	sext.w	a4,a5
   10338:	00400793          	li	a5,4
   1033c:	f8e7d2e3          	bge	a5,a4,102c0 <main+0x168>
   10340:	00000793          	li	a5,0
   10344:	00078513          	mv	a0,a5
   10348:	02813083          	ld	ra,40(sp)
   1034c:	02013403          	ld	s0,32(sp)
   10350:	03010113          	addi	sp,sp,48
   10354:	00008067          	ret

0000000000010358 <PrintInt>:
   10358:	fe010113          	addi	sp,sp,-32
   1035c:	00813c23          	sd	s0,24(sp)
   10360:	02010413          	addi	s0,sp,32
   10364:	00050793          	mv	a5,a0
   10368:	fef42623          	sw	a5,-20(s0)
   1036c:	00000893          	li	a7,0
   10370:	00000073          	ecall
   10374:	00000013          	nop
   10378:	01813403          	ld	s0,24(sp)
   1037c:	02010113          	addi	sp,sp,32
   10380:	00008067          	ret

0000000000010384 <PrintChar>:
   10384:	fe010113          	addi	sp,sp,-32
   10388:	00813c23          	sd	s0,24(sp)
   1038c:	02010413          	addi	s0,sp,32
   10390:	00050793          	mv	a5,a0
   10394:	fef407a3          	sb	a5,-17(s0)
   10398:	00100893          	li	a7,1
   1039c:	00000073          	ecall
   103a0:	00000013          	nop
   103a4:	01813403          	ld	s0,24(sp)
   103a8:	02010113          	addi	sp,sp,32
   103ac:	00008067          	ret

00000000000103b0 <exit>:
   103b0:	1141                	addi	sp,sp,-16
   103b2:	4581                	li	a1,0
   103b4:	e022                	sd	s0,0(sp)
   103b6:	e406                	sd	ra,8(sp)
   103b8:	842a                	mv	s0,a0
   103ba:	128000ef          	jal	ra,104e2 <__call_exitprocs>
   103be:	0181b503          	ld	a0,24(gp) # 11ec0 <_global_impure_ptr>
   103c2:	6d3c                	ld	a5,88(a0)
   103c4:	c391                	beqz	a5,103c8 <exit+0x18>
   103c6:	9782                	jalr	a5
   103c8:	8522                	mv	a0,s0
   103ca:	28e000ef          	jal	ra,10658 <_exit>

00000000000103ce <__libc_init_array>:
   103ce:	1101                	addi	sp,sp,-32
   103d0:	e822                	sd	s0,16(sp)
   103d2:	e04a                	sd	s2,0(sp)
   103d4:	6445                	lui	s0,0x11
   103d6:	6945                	lui	s2,0x11
   103d8:	69040793          	addi	a5,s0,1680 # 11690 <__init_array_start>
   103dc:	69090913          	addi	s2,s2,1680 # 11690 <__init_array_start>
   103e0:	40f90933          	sub	s2,s2,a5
   103e4:	ec06                	sd	ra,24(sp)
   103e6:	e426                	sd	s1,8(sp)
   103e8:	40395913          	srai	s2,s2,0x3
   103ec:	00090b63          	beqz	s2,10402 <__libc_init_array+0x34>
   103f0:	69040413          	addi	s0,s0,1680
   103f4:	4481                	li	s1,0
   103f6:	601c                	ld	a5,0(s0)
   103f8:	0485                	addi	s1,s1,1
   103fa:	0421                	addi	s0,s0,8
   103fc:	9782                	jalr	a5
   103fe:	fe991ce3          	bne	s2,s1,103f6 <__libc_init_array+0x28>
   10402:	6445                	lui	s0,0x11
   10404:	6945                	lui	s2,0x11
   10406:	69040793          	addi	a5,s0,1680 # 11690 <__init_array_start>
   1040a:	6a090913          	addi	s2,s2,1696 # 116a0 <__init_array_end>
   1040e:	40f90933          	sub	s2,s2,a5
   10412:	40395913          	srai	s2,s2,0x3
   10416:	00090b63          	beqz	s2,1042c <__libc_init_array+0x5e>
   1041a:	69040413          	addi	s0,s0,1680
   1041e:	4481                	li	s1,0
   10420:	601c                	ld	a5,0(s0)
   10422:	0485                	addi	s1,s1,1
   10424:	0421                	addi	s0,s0,8
   10426:	9782                	jalr	a5
   10428:	fe991ce3          	bne	s2,s1,10420 <__libc_init_array+0x52>
   1042c:	60e2                	ld	ra,24(sp)
   1042e:	6442                	ld	s0,16(sp)
   10430:	64a2                	ld	s1,8(sp)
   10432:	6902                	ld	s2,0(sp)
   10434:	6105                	addi	sp,sp,32
   10436:	8082                	ret

0000000000010438 <memset>:
   10438:	433d                	li	t1,15
   1043a:	872a                	mv	a4,a0
   1043c:	02c37163          	bgeu	t1,a2,1045e <memset+0x26>
   10440:	00f77793          	andi	a5,a4,15
   10444:	e3c1                	bnez	a5,104c4 <memset+0x8c>
   10446:	e1bd                	bnez	a1,104ac <memset+0x74>
   10448:	ff067693          	andi	a3,a2,-16
   1044c:	8a3d                	andi	a2,a2,15
   1044e:	96ba                	add	a3,a3,a4
   10450:	e30c                	sd	a1,0(a4)
   10452:	e70c                	sd	a1,8(a4)
   10454:	0741                	addi	a4,a4,16
   10456:	fed76de3          	bltu	a4,a3,10450 <memset+0x18>
   1045a:	e211                	bnez	a2,1045e <memset+0x26>
   1045c:	8082                	ret
   1045e:	40c306b3          	sub	a3,t1,a2
   10462:	068a                	slli	a3,a3,0x2
   10464:	00000297          	auipc	t0,0x0
   10468:	9696                	add	a3,a3,t0
   1046a:	00a68067          	jr	10(a3)
   1046e:	00b70723          	sb	a1,14(a4)
   10472:	00b706a3          	sb	a1,13(a4)
   10476:	00b70623          	sb	a1,12(a4)
   1047a:	00b705a3          	sb	a1,11(a4)
   1047e:	00b70523          	sb	a1,10(a4)
   10482:	00b704a3          	sb	a1,9(a4)
   10486:	00b70423          	sb	a1,8(a4)
   1048a:	00b703a3          	sb	a1,7(a4)
   1048e:	00b70323          	sb	a1,6(a4)
   10492:	00b702a3          	sb	a1,5(a4)
   10496:	00b70223          	sb	a1,4(a4)
   1049a:	00b701a3          	sb	a1,3(a4)
   1049e:	00b70123          	sb	a1,2(a4)
   104a2:	00b700a3          	sb	a1,1(a4)
   104a6:	00b70023          	sb	a1,0(a4)
   104aa:	8082                	ret
   104ac:	0ff5f593          	andi	a1,a1,255
   104b0:	00859693          	slli	a3,a1,0x8
   104b4:	8dd5                	or	a1,a1,a3
   104b6:	01059693          	slli	a3,a1,0x10
   104ba:	8dd5                	or	a1,a1,a3
   104bc:	02059693          	slli	a3,a1,0x20
   104c0:	8dd5                	or	a1,a1,a3
   104c2:	b759                	j	10448 <memset+0x10>
   104c4:	00279693          	slli	a3,a5,0x2
   104c8:	00000297          	auipc	t0,0x0
   104cc:	9696                	add	a3,a3,t0
   104ce:	8286                	mv	t0,ra
   104d0:	fa2680e7          	jalr	-94(a3)
   104d4:	8096                	mv	ra,t0
   104d6:	17c1                	addi	a5,a5,-16
   104d8:	8f1d                	sub	a4,a4,a5
   104da:	963e                	add	a2,a2,a5
   104dc:	f8c371e3          	bgeu	t1,a2,1045e <memset+0x26>
   104e0:	b79d                	j	10446 <memset+0xe>

00000000000104e2 <__call_exitprocs>:
   104e2:	715d                	addi	sp,sp,-80
   104e4:	f052                	sd	s4,32(sp)
   104e6:	0181ba03          	ld	s4,24(gp) # 11ec0 <_global_impure_ptr>
   104ea:	f84a                	sd	s2,48(sp)
   104ec:	e486                	sd	ra,72(sp)
   104ee:	1f8a3903          	ld	s2,504(s4)
   104f2:	e0a2                	sd	s0,64(sp)
   104f4:	fc26                	sd	s1,56(sp)
   104f6:	f44e                	sd	s3,40(sp)
   104f8:	ec56                	sd	s5,24(sp)
   104fa:	e85a                	sd	s6,16(sp)
   104fc:	e45e                	sd	s7,8(sp)
   104fe:	e062                	sd	s8,0(sp)
   10500:	02090863          	beqz	s2,10530 <__call_exitprocs+0x4e>
   10504:	8b2a                	mv	s6,a0
   10506:	8bae                	mv	s7,a1
   10508:	4a85                	li	s5,1
   1050a:	59fd                	li	s3,-1
   1050c:	00892483          	lw	s1,8(s2)
   10510:	fff4841b          	addiw	s0,s1,-1
   10514:	00044e63          	bltz	s0,10530 <__call_exitprocs+0x4e>
   10518:	048e                	slli	s1,s1,0x3
   1051a:	94ca                	add	s1,s1,s2
   1051c:	020b8663          	beqz	s7,10548 <__call_exitprocs+0x66>
   10520:	2084b783          	ld	a5,520(s1)
   10524:	03778263          	beq	a5,s7,10548 <__call_exitprocs+0x66>
   10528:	347d                	addiw	s0,s0,-1
   1052a:	14e1                	addi	s1,s1,-8
   1052c:	ff3418e3          	bne	s0,s3,1051c <__call_exitprocs+0x3a>
   10530:	60a6                	ld	ra,72(sp)
   10532:	6406                	ld	s0,64(sp)
   10534:	74e2                	ld	s1,56(sp)
   10536:	7942                	ld	s2,48(sp)
   10538:	79a2                	ld	s3,40(sp)
   1053a:	7a02                	ld	s4,32(sp)
   1053c:	6ae2                	ld	s5,24(sp)
   1053e:	6b42                	ld	s6,16(sp)
   10540:	6ba2                	ld	s7,8(sp)
   10542:	6c02                	ld	s8,0(sp)
   10544:	6161                	addi	sp,sp,80
   10546:	8082                	ret
   10548:	00892783          	lw	a5,8(s2)
   1054c:	6498                	ld	a4,8(s1)
   1054e:	37fd                	addiw	a5,a5,-1
   10550:	04878463          	beq	a5,s0,10598 <__call_exitprocs+0xb6>
   10554:	0004b423          	sd	zero,8(s1)
   10558:	db61                	beqz	a4,10528 <__call_exitprocs+0x46>
   1055a:	31092783          	lw	a5,784(s2)
   1055e:	008a96bb          	sllw	a3,s5,s0
   10562:	00892c03          	lw	s8,8(s2)
   10566:	8ff5                	and	a5,a5,a3
   10568:	2781                	sext.w	a5,a5
   1056a:	ef89                	bnez	a5,10584 <__call_exitprocs+0xa2>
   1056c:	9702                	jalr	a4
   1056e:	00892703          	lw	a4,8(s2)
   10572:	1f8a3783          	ld	a5,504(s4)
   10576:	01871463          	bne	a4,s8,1057e <__call_exitprocs+0x9c>
   1057a:	faf907e3          	beq	s2,a5,10528 <__call_exitprocs+0x46>
   1057e:	dbcd                	beqz	a5,10530 <__call_exitprocs+0x4e>
   10580:	893e                	mv	s2,a5
   10582:	b769                	j	1050c <__call_exitprocs+0x2a>
   10584:	31492783          	lw	a5,788(s2)
   10588:	1084b583          	ld	a1,264(s1)
   1058c:	8ff5                	and	a5,a5,a3
   1058e:	2781                	sext.w	a5,a5
   10590:	e799                	bnez	a5,1059e <__call_exitprocs+0xbc>
   10592:	855a                	mv	a0,s6
   10594:	9702                	jalr	a4
   10596:	bfe1                	j	1056e <__call_exitprocs+0x8c>
   10598:	00892423          	sw	s0,8(s2)
   1059c:	bf75                	j	10558 <__call_exitprocs+0x76>
   1059e:	852e                	mv	a0,a1
   105a0:	9702                	jalr	a4
   105a2:	b7f1                	j	1056e <__call_exitprocs+0x8c>

00000000000105a4 <__libc_fini_array>:
   105a4:	1101                	addi	sp,sp,-32
   105a6:	e822                	sd	s0,16(sp)
   105a8:	67c5                	lui	a5,0x11
   105aa:	6445                	lui	s0,0x11
   105ac:	6a040413          	addi	s0,s0,1696 # 116a0 <__init_array_end>
   105b0:	6a878793          	addi	a5,a5,1704 # 116a8 <__fini_array_end>
   105b4:	8f81                	sub	a5,a5,s0
   105b6:	e426                	sd	s1,8(sp)
   105b8:	ec06                	sd	ra,24(sp)
   105ba:	4037d493          	srai	s1,a5,0x3
   105be:	c881                	beqz	s1,105ce <__libc_fini_array+0x2a>
   105c0:	17e1                	addi	a5,a5,-8
   105c2:	943e                	add	s0,s0,a5
   105c4:	601c                	ld	a5,0(s0)
   105c6:	14fd                	addi	s1,s1,-1
   105c8:	1461                	addi	s0,s0,-8
   105ca:	9782                	jalr	a5
   105cc:	fce5                	bnez	s1,105c4 <__libc_fini_array+0x20>
   105ce:	60e2                	ld	ra,24(sp)
   105d0:	6442                	ld	s0,16(sp)
   105d2:	64a2                	ld	s1,8(sp)
   105d4:	6105                	addi	sp,sp,32
   105d6:	8082                	ret

00000000000105d8 <atexit>:
   105d8:	85aa                	mv	a1,a0
   105da:	4681                	li	a3,0
   105dc:	4601                	li	a2,0
   105de:	4501                	li	a0,0
   105e0:	a009                	j	105e2 <__register_exitproc>

00000000000105e2 <__register_exitproc>:
   105e2:	0181b703          	ld	a4,24(gp) # 11ec0 <_global_impure_ptr>
   105e6:	1f873783          	ld	a5,504(a4)
   105ea:	c3b1                	beqz	a5,1062e <__register_exitproc+0x4c>
   105ec:	4798                	lw	a4,8(a5)
   105ee:	487d                	li	a6,31
   105f0:	06e84263          	blt	a6,a4,10654 <__register_exitproc+0x72>
   105f4:	c505                	beqz	a0,1061c <__register_exitproc+0x3a>
   105f6:	00371813          	slli	a6,a4,0x3
   105fa:	983e                	add	a6,a6,a5
   105fc:	10c83823          	sd	a2,272(a6)
   10600:	3107a883          	lw	a7,784(a5)
   10604:	4605                	li	a2,1
   10606:	00e6163b          	sllw	a2,a2,a4
   1060a:	00c8e8b3          	or	a7,a7,a2
   1060e:	3117a823          	sw	a7,784(a5)
   10612:	20d83823          	sd	a3,528(a6)
   10616:	4689                	li	a3,2
   10618:	02d50063          	beq	a0,a3,10638 <__register_exitproc+0x56>
   1061c:	00270693          	addi	a3,a4,2
   10620:	068e                	slli	a3,a3,0x3
   10622:	2705                	addiw	a4,a4,1
   10624:	c798                	sw	a4,8(a5)
   10626:	97b6                	add	a5,a5,a3
   10628:	e38c                	sd	a1,0(a5)
   1062a:	4501                	li	a0,0
   1062c:	8082                	ret
   1062e:	20070793          	addi	a5,a4,512
   10632:	1ef73c23          	sd	a5,504(a4)
   10636:	bf5d                	j	105ec <__register_exitproc+0xa>
   10638:	3147a683          	lw	a3,788(a5)
   1063c:	4501                	li	a0,0
   1063e:	8e55                	or	a2,a2,a3
   10640:	00270693          	addi	a3,a4,2
   10644:	068e                	slli	a3,a3,0x3
   10646:	2705                	addiw	a4,a4,1
   10648:	30c7aa23          	sw	a2,788(a5)
   1064c:	c798                	sw	a4,8(a5)
   1064e:	97b6                	add	a5,a5,a3
   10650:	e38c                	sd	a1,0(a5)
   10652:	8082                	ret
   10654:	557d                	li	a0,-1
   10656:	8082                	ret

0000000000010658 <_exit>:
   10658:	4581                	li	a1,0
   1065a:	4601                	li	a2,0
   1065c:	4681                	li	a3,0
   1065e:	4701                	li	a4,0
   10660:	4781                	li	a5,0
   10662:	05d00893          	li	a7,93
   10666:	00000073          	ecall
   1066a:	00054363          	bltz	a0,10670 <_exit+0x18>
   1066e:	a001                	j	1066e <_exit+0x16>
   10670:	1141                	addi	sp,sp,-16
   10672:	e022                	sd	s0,0(sp)
   10674:	842a                	mv	s0,a0
   10676:	e406                	sd	ra,8(sp)
   10678:	4080043b          	negw	s0,s0
   1067c:	008000ef          	jal	ra,10684 <__errno>
   10680:	c100                	sw	s0,0(a0)
   10682:	a001                	j	10682 <_exit+0x2a>

0000000000010684 <__errno>:
   10684:	0281b503          	ld	a0,40(gp) # 11ed0 <_impure_ptr>
   10688:	8082                	ret
