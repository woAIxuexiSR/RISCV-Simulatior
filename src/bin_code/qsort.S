
bin_code/qsort:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	62450513          	addi	a0,a0,1572 # 10624 <__libc_fini_array>
   100c0:	ab61                	j	10658 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	e6418193          	addi	gp,gp,-412 # 11f28 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11e88 <_edata>
   100d0:	04018613          	addi	a2,gp,64 # 11f68 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	3e0000ef          	jal	ra,104b8 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	57c50513          	addi	a0,a0,1404 # 10658 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	53e50513          	addi	a0,a0,1342 # 10624 <__libc_fini_array>
   100ee:	56a000ef          	jal	ra,10658 <atexit>
   100f2:	35c000ef          	jal	ra,1044e <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	210000ef          	jal	ra,1030c <main>
   10100:	ae05                	j	10430 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11e88 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	70c50513          	addi	a0,a0,1804 # 1170c <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11e88 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11e90 <object.5532>
   10148:	70c50513          	addi	a0,a0,1804 # 1170c <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

0000000000010158 <qsort>:
   10158:	fd010113          	addi	sp,sp,-48
   1015c:	02113423          	sd	ra,40(sp)
   10160:	02813023          	sd	s0,32(sp)
   10164:	03010413          	addi	s0,sp,48
   10168:	00050793          	mv	a5,a0
   1016c:	00058713          	mv	a4,a1
   10170:	fcf42e23          	sw	a5,-36(s0)
   10174:	00070793          	mv	a5,a4
   10178:	fcf42c23          	sw	a5,-40(s0)
   1017c:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   10180:	fdc42783          	lw	a5,-36(s0)
   10184:	00279793          	slli	a5,a5,0x2
   10188:	00f707b3          	add	a5,a4,a5
   1018c:	0007a783          	lw	a5,0(a5) # 0 <register_fini-0x100b0>
   10190:	fef42223          	sw	a5,-28(s0)
   10194:	fdc42783          	lw	a5,-36(s0)
   10198:	fef42623          	sw	a5,-20(s0)
   1019c:	fd842783          	lw	a5,-40(s0)
   101a0:	fef42423          	sw	a5,-24(s0)
   101a4:	fdc42703          	lw	a4,-36(s0)
   101a8:	fd842783          	lw	a5,-40(s0)
   101ac:	0007071b          	sext.w	a4,a4
   101b0:	0007879b          	sext.w	a5,a5
   101b4:	14f75263          	bge	a4,a5,102f8 <qsort+0x1a0>
   101b8:	0d80006f          	j	10290 <qsort+0x138>
   101bc:	fe842783          	lw	a5,-24(s0)
   101c0:	fff7879b          	addiw	a5,a5,-1
   101c4:	fef42423          	sw	a5,-24(s0)
   101c8:	fec42703          	lw	a4,-20(s0)
   101cc:	fe842783          	lw	a5,-24(s0)
   101d0:	0007071b          	sext.w	a4,a4
   101d4:	0007879b          	sext.w	a5,a5
   101d8:	02f75263          	bge	a4,a5,101fc <qsort+0xa4>
   101dc:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   101e0:	fe842783          	lw	a5,-24(s0)
   101e4:	00279793          	slli	a5,a5,0x2
   101e8:	00f707b3          	add	a5,a4,a5
   101ec:	0007a703          	lw	a4,0(a5)
   101f0:	fe442783          	lw	a5,-28(s0)
   101f4:	0007879b          	sext.w	a5,a5
   101f8:	fcf752e3          	bge	a4,a5,101bc <qsort+0x64>
   101fc:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   10200:	fe842783          	lw	a5,-24(s0)
   10204:	00279793          	slli	a5,a5,0x2
   10208:	00f707b3          	add	a5,a4,a5
   1020c:	0007a703          	lw	a4,0(a5)
   10210:	f9818693          	addi	a3,gp,-104 # 11ec0 <result>
   10214:	fec42783          	lw	a5,-20(s0)
   10218:	00279793          	slli	a5,a5,0x2
   1021c:	00f687b3          	add	a5,a3,a5
   10220:	00e7a023          	sw	a4,0(a5)
   10224:	0100006f          	j	10234 <qsort+0xdc>
   10228:	fec42783          	lw	a5,-20(s0)
   1022c:	0017879b          	addiw	a5,a5,1
   10230:	fef42623          	sw	a5,-20(s0)
   10234:	fec42703          	lw	a4,-20(s0)
   10238:	fe842783          	lw	a5,-24(s0)
   1023c:	0007071b          	sext.w	a4,a4
   10240:	0007879b          	sext.w	a5,a5
   10244:	02f75263          	bge	a4,a5,10268 <qsort+0x110>
   10248:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   1024c:	fec42783          	lw	a5,-20(s0)
   10250:	00279793          	slli	a5,a5,0x2
   10254:	00f707b3          	add	a5,a4,a5
   10258:	0007a703          	lw	a4,0(a5)
   1025c:	fe442783          	lw	a5,-28(s0)
   10260:	0007879b          	sext.w	a5,a5
   10264:	fce7d2e3          	bge	a5,a4,10228 <qsort+0xd0>
   10268:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   1026c:	fec42783          	lw	a5,-20(s0)
   10270:	00279793          	slli	a5,a5,0x2
   10274:	00f707b3          	add	a5,a4,a5
   10278:	0007a703          	lw	a4,0(a5)
   1027c:	f9818693          	addi	a3,gp,-104 # 11ec0 <result>
   10280:	fe842783          	lw	a5,-24(s0)
   10284:	00279793          	slli	a5,a5,0x2
   10288:	00f687b3          	add	a5,a3,a5
   1028c:	00e7a023          	sw	a4,0(a5)
   10290:	fec42703          	lw	a4,-20(s0)
   10294:	fe842783          	lw	a5,-24(s0)
   10298:	0007071b          	sext.w	a4,a4
   1029c:	0007879b          	sext.w	a5,a5
   102a0:	f2f744e3          	blt	a4,a5,101c8 <qsort+0x70>
   102a4:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   102a8:	fec42783          	lw	a5,-20(s0)
   102ac:	00279793          	slli	a5,a5,0x2
   102b0:	00f707b3          	add	a5,a4,a5
   102b4:	fe442703          	lw	a4,-28(s0)
   102b8:	00e7a023          	sw	a4,0(a5)
   102bc:	fec42783          	lw	a5,-20(s0)
   102c0:	fff7879b          	addiw	a5,a5,-1
   102c4:	0007871b          	sext.w	a4,a5
   102c8:	fdc42783          	lw	a5,-36(s0)
   102cc:	00070593          	mv	a1,a4
   102d0:	00078513          	mv	a0,a5
   102d4:	e85ff0ef          	jal	ra,10158 <qsort>
   102d8:	fec42783          	lw	a5,-20(s0)
   102dc:	0017879b          	addiw	a5,a5,1
   102e0:	0007879b          	sext.w	a5,a5
   102e4:	fd842703          	lw	a4,-40(s0)
   102e8:	00070593          	mv	a1,a4
   102ec:	00078513          	mv	a0,a5
   102f0:	e69ff0ef          	jal	ra,10158 <qsort>
   102f4:	0080006f          	j	102fc <qsort+0x1a4>
   102f8:	00000013          	nop
   102fc:	02813083          	ld	ra,40(sp)
   10300:	02013403          	ld	s0,32(sp)
   10304:	03010113          	addi	sp,sp,48
   10308:	00008067          	ret

000000000001030c <main>:
   1030c:	fe010113          	addi	sp,sp,-32
   10310:	00113c23          	sd	ra,24(sp)
   10314:	00813823          	sd	s0,16(sp)
   10318:	02010413          	addi	s0,sp,32
   1031c:	fe042623          	sw	zero,-20(s0)
   10320:	0340006f          	j	10354 <main+0x48>
   10324:	02800713          	li	a4,40
   10328:	fec42783          	lw	a5,-20(s0)
   1032c:	40f707bb          	subw	a5,a4,a5
   10330:	0007871b          	sext.w	a4,a5
   10334:	f9818693          	addi	a3,gp,-104 # 11ec0 <result>
   10338:	fec42783          	lw	a5,-20(s0)
   1033c:	00279793          	slli	a5,a5,0x2
   10340:	00f687b3          	add	a5,a3,a5
   10344:	00e7a023          	sw	a4,0(a5)
   10348:	fec42783          	lw	a5,-20(s0)
   1034c:	0017879b          	addiw	a5,a5,1
   10350:	fef42623          	sw	a5,-20(s0)
   10354:	fec42783          	lw	a5,-20(s0)
   10358:	0007871b          	sext.w	a4,a5
   1035c:	02700793          	li	a5,39
   10360:	fce7d2e3          	bge	a5,a4,10324 <main+0x18>
   10364:	02700593          	li	a1,39
   10368:	00000513          	li	a0,0
   1036c:	dedff0ef          	jal	ra,10158 <qsort>
   10370:	fe042423          	sw	zero,-24(s0)
   10374:	0340006f          	j	103a8 <main+0x9c>
   10378:	f9818713          	addi	a4,gp,-104 # 11ec0 <result>
   1037c:	fe842783          	lw	a5,-24(s0)
   10380:	00279793          	slli	a5,a5,0x2
   10384:	00f707b3          	add	a5,a4,a5
   10388:	0007a783          	lw	a5,0(a5)
   1038c:	00078513          	mv	a0,a5
   10390:	048000ef          	jal	ra,103d8 <PrintInt>
   10394:	02000513          	li	a0,32
   10398:	06c000ef          	jal	ra,10404 <PrintChar>
   1039c:	fe842783          	lw	a5,-24(s0)
   103a0:	0017879b          	addiw	a5,a5,1
   103a4:	fef42423          	sw	a5,-24(s0)
   103a8:	fe842783          	lw	a5,-24(s0)
   103ac:	0007871b          	sext.w	a4,a5
   103b0:	02700793          	li	a5,39
   103b4:	fce7d2e3          	bge	a5,a4,10378 <main+0x6c>
   103b8:	00a00513          	li	a0,10
   103bc:	048000ef          	jal	ra,10404 <PrintChar>
   103c0:	00000793          	li	a5,0
   103c4:	00078513          	mv	a0,a5
   103c8:	01813083          	ld	ra,24(sp)
   103cc:	01013403          	ld	s0,16(sp)
   103d0:	02010113          	addi	sp,sp,32
   103d4:	00008067          	ret

00000000000103d8 <PrintInt>:
   103d8:	fe010113          	addi	sp,sp,-32
   103dc:	00813c23          	sd	s0,24(sp)
   103e0:	02010413          	addi	s0,sp,32
   103e4:	00050793          	mv	a5,a0
   103e8:	fef42623          	sw	a5,-20(s0)
   103ec:	00000893          	li	a7,0
   103f0:	00000073          	ecall
   103f4:	00000013          	nop
   103f8:	01813403          	ld	s0,24(sp)
   103fc:	02010113          	addi	sp,sp,32
   10400:	00008067          	ret

0000000000010404 <PrintChar>:
   10404:	fe010113          	addi	sp,sp,-32
   10408:	00813c23          	sd	s0,24(sp)
   1040c:	02010413          	addi	s0,sp,32
   10410:	00050793          	mv	a5,a0
   10414:	fef407a3          	sb	a5,-17(s0)
   10418:	00100893          	li	a7,1
   1041c:	00000073          	ecall
   10420:	00000013          	nop
   10424:	01813403          	ld	s0,24(sp)
   10428:	02010113          	addi	sp,sp,32
   1042c:	00008067          	ret

0000000000010430 <exit>:
   10430:	1141                	addi	sp,sp,-16
   10432:	4581                	li	a1,0
   10434:	e022                	sd	s0,0(sp)
   10436:	e406                	sd	ra,8(sp)
   10438:	842a                	mv	s0,a0
   1043a:	128000ef          	jal	ra,10562 <__call_exitprocs>
   1043e:	f481b503          	ld	a0,-184(gp) # 11e70 <_global_impure_ptr>
   10442:	6d3c                	ld	a5,88(a0)
   10444:	c391                	beqz	a5,10448 <exit+0x18>
   10446:	9782                	jalr	a5
   10448:	8522                	mv	a0,s0
   1044a:	28e000ef          	jal	ra,106d8 <_exit>

000000000001044e <__libc_init_array>:
   1044e:	1101                	addi	sp,sp,-32
   10450:	e822                	sd	s0,16(sp)
   10452:	e04a                	sd	s2,0(sp)
   10454:	6445                	lui	s0,0x11
   10456:	6945                	lui	s2,0x11
   10458:	71040793          	addi	a5,s0,1808 # 11710 <__init_array_start>
   1045c:	71090913          	addi	s2,s2,1808 # 11710 <__init_array_start>
   10460:	40f90933          	sub	s2,s2,a5
   10464:	ec06                	sd	ra,24(sp)
   10466:	e426                	sd	s1,8(sp)
   10468:	40395913          	srai	s2,s2,0x3
   1046c:	00090b63          	beqz	s2,10482 <__libc_init_array+0x34>
   10470:	71040413          	addi	s0,s0,1808
   10474:	4481                	li	s1,0
   10476:	601c                	ld	a5,0(s0)
   10478:	0485                	addi	s1,s1,1
   1047a:	0421                	addi	s0,s0,8
   1047c:	9782                	jalr	a5
   1047e:	fe991ce3          	bne	s2,s1,10476 <__libc_init_array+0x28>
   10482:	6445                	lui	s0,0x11
   10484:	6945                	lui	s2,0x11
   10486:	71040793          	addi	a5,s0,1808 # 11710 <__init_array_start>
   1048a:	72090913          	addi	s2,s2,1824 # 11720 <__init_array_end>
   1048e:	40f90933          	sub	s2,s2,a5
   10492:	40395913          	srai	s2,s2,0x3
   10496:	00090b63          	beqz	s2,104ac <__libc_init_array+0x5e>
   1049a:	71040413          	addi	s0,s0,1808
   1049e:	4481                	li	s1,0
   104a0:	601c                	ld	a5,0(s0)
   104a2:	0485                	addi	s1,s1,1
   104a4:	0421                	addi	s0,s0,8
   104a6:	9782                	jalr	a5
   104a8:	fe991ce3          	bne	s2,s1,104a0 <__libc_init_array+0x52>
   104ac:	60e2                	ld	ra,24(sp)
   104ae:	6442                	ld	s0,16(sp)
   104b0:	64a2                	ld	s1,8(sp)
   104b2:	6902                	ld	s2,0(sp)
   104b4:	6105                	addi	sp,sp,32
   104b6:	8082                	ret

00000000000104b8 <memset>:
   104b8:	433d                	li	t1,15
   104ba:	872a                	mv	a4,a0
   104bc:	02c37163          	bgeu	t1,a2,104de <memset+0x26>
   104c0:	00f77793          	andi	a5,a4,15
   104c4:	e3c1                	bnez	a5,10544 <memset+0x8c>
   104c6:	e1bd                	bnez	a1,1052c <memset+0x74>
   104c8:	ff067693          	andi	a3,a2,-16
   104cc:	8a3d                	andi	a2,a2,15
   104ce:	96ba                	add	a3,a3,a4
   104d0:	e30c                	sd	a1,0(a4)
   104d2:	e70c                	sd	a1,8(a4)
   104d4:	0741                	addi	a4,a4,16
   104d6:	fed76de3          	bltu	a4,a3,104d0 <memset+0x18>
   104da:	e211                	bnez	a2,104de <memset+0x26>
   104dc:	8082                	ret
   104de:	40c306b3          	sub	a3,t1,a2
   104e2:	068a                	slli	a3,a3,0x2
   104e4:	00000297          	auipc	t0,0x0
   104e8:	9696                	add	a3,a3,t0
   104ea:	00a68067          	jr	10(a3)
   104ee:	00b70723          	sb	a1,14(a4)
   104f2:	00b706a3          	sb	a1,13(a4)
   104f6:	00b70623          	sb	a1,12(a4)
   104fa:	00b705a3          	sb	a1,11(a4)
   104fe:	00b70523          	sb	a1,10(a4)
   10502:	00b704a3          	sb	a1,9(a4)
   10506:	00b70423          	sb	a1,8(a4)
   1050a:	00b703a3          	sb	a1,7(a4)
   1050e:	00b70323          	sb	a1,6(a4)
   10512:	00b702a3          	sb	a1,5(a4)
   10516:	00b70223          	sb	a1,4(a4)
   1051a:	00b701a3          	sb	a1,3(a4)
   1051e:	00b70123          	sb	a1,2(a4)
   10522:	00b700a3          	sb	a1,1(a4)
   10526:	00b70023          	sb	a1,0(a4)
   1052a:	8082                	ret
   1052c:	0ff5f593          	andi	a1,a1,255
   10530:	00859693          	slli	a3,a1,0x8
   10534:	8dd5                	or	a1,a1,a3
   10536:	01059693          	slli	a3,a1,0x10
   1053a:	8dd5                	or	a1,a1,a3
   1053c:	02059693          	slli	a3,a1,0x20
   10540:	8dd5                	or	a1,a1,a3
   10542:	b759                	j	104c8 <memset+0x10>
   10544:	00279693          	slli	a3,a5,0x2
   10548:	00000297          	auipc	t0,0x0
   1054c:	9696                	add	a3,a3,t0
   1054e:	8286                	mv	t0,ra
   10550:	fa2680e7          	jalr	-94(a3)
   10554:	8096                	mv	ra,t0
   10556:	17c1                	addi	a5,a5,-16
   10558:	8f1d                	sub	a4,a4,a5
   1055a:	963e                	add	a2,a2,a5
   1055c:	f8c371e3          	bgeu	t1,a2,104de <memset+0x26>
   10560:	b79d                	j	104c6 <memset+0xe>

0000000000010562 <__call_exitprocs>:
   10562:	715d                	addi	sp,sp,-80
   10564:	f052                	sd	s4,32(sp)
   10566:	f481ba03          	ld	s4,-184(gp) # 11e70 <_global_impure_ptr>
   1056a:	f84a                	sd	s2,48(sp)
   1056c:	e486                	sd	ra,72(sp)
   1056e:	1f8a3903          	ld	s2,504(s4)
   10572:	e0a2                	sd	s0,64(sp)
   10574:	fc26                	sd	s1,56(sp)
   10576:	f44e                	sd	s3,40(sp)
   10578:	ec56                	sd	s5,24(sp)
   1057a:	e85a                	sd	s6,16(sp)
   1057c:	e45e                	sd	s7,8(sp)
   1057e:	e062                	sd	s8,0(sp)
   10580:	02090863          	beqz	s2,105b0 <__call_exitprocs+0x4e>
   10584:	8b2a                	mv	s6,a0
   10586:	8bae                	mv	s7,a1
   10588:	4a85                	li	s5,1
   1058a:	59fd                	li	s3,-1
   1058c:	00892483          	lw	s1,8(s2)
   10590:	fff4841b          	addiw	s0,s1,-1
   10594:	00044e63          	bltz	s0,105b0 <__call_exitprocs+0x4e>
   10598:	048e                	slli	s1,s1,0x3
   1059a:	94ca                	add	s1,s1,s2
   1059c:	020b8663          	beqz	s7,105c8 <__call_exitprocs+0x66>
   105a0:	2084b783          	ld	a5,520(s1)
   105a4:	03778263          	beq	a5,s7,105c8 <__call_exitprocs+0x66>
   105a8:	347d                	addiw	s0,s0,-1
   105aa:	14e1                	addi	s1,s1,-8
   105ac:	ff3418e3          	bne	s0,s3,1059c <__call_exitprocs+0x3a>
   105b0:	60a6                	ld	ra,72(sp)
   105b2:	6406                	ld	s0,64(sp)
   105b4:	74e2                	ld	s1,56(sp)
   105b6:	7942                	ld	s2,48(sp)
   105b8:	79a2                	ld	s3,40(sp)
   105ba:	7a02                	ld	s4,32(sp)
   105bc:	6ae2                	ld	s5,24(sp)
   105be:	6b42                	ld	s6,16(sp)
   105c0:	6ba2                	ld	s7,8(sp)
   105c2:	6c02                	ld	s8,0(sp)
   105c4:	6161                	addi	sp,sp,80
   105c6:	8082                	ret
   105c8:	00892783          	lw	a5,8(s2)
   105cc:	6498                	ld	a4,8(s1)
   105ce:	37fd                	addiw	a5,a5,-1
   105d0:	04878463          	beq	a5,s0,10618 <__call_exitprocs+0xb6>
   105d4:	0004b423          	sd	zero,8(s1)
   105d8:	db61                	beqz	a4,105a8 <__call_exitprocs+0x46>
   105da:	31092783          	lw	a5,784(s2)
   105de:	008a96bb          	sllw	a3,s5,s0
   105e2:	00892c03          	lw	s8,8(s2)
   105e6:	8ff5                	and	a5,a5,a3
   105e8:	2781                	sext.w	a5,a5
   105ea:	ef89                	bnez	a5,10604 <__call_exitprocs+0xa2>
   105ec:	9702                	jalr	a4
   105ee:	00892703          	lw	a4,8(s2)
   105f2:	1f8a3783          	ld	a5,504(s4)
   105f6:	01871463          	bne	a4,s8,105fe <__call_exitprocs+0x9c>
   105fa:	faf907e3          	beq	s2,a5,105a8 <__call_exitprocs+0x46>
   105fe:	dbcd                	beqz	a5,105b0 <__call_exitprocs+0x4e>
   10600:	893e                	mv	s2,a5
   10602:	b769                	j	1058c <__call_exitprocs+0x2a>
   10604:	31492783          	lw	a5,788(s2)
   10608:	1084b583          	ld	a1,264(s1)
   1060c:	8ff5                	and	a5,a5,a3
   1060e:	2781                	sext.w	a5,a5
   10610:	e799                	bnez	a5,1061e <__call_exitprocs+0xbc>
   10612:	855a                	mv	a0,s6
   10614:	9702                	jalr	a4
   10616:	bfe1                	j	105ee <__call_exitprocs+0x8c>
   10618:	00892423          	sw	s0,8(s2)
   1061c:	bf75                	j	105d8 <__call_exitprocs+0x76>
   1061e:	852e                	mv	a0,a1
   10620:	9702                	jalr	a4
   10622:	b7f1                	j	105ee <__call_exitprocs+0x8c>

0000000000010624 <__libc_fini_array>:
   10624:	1101                	addi	sp,sp,-32
   10626:	e822                	sd	s0,16(sp)
   10628:	67c5                	lui	a5,0x11
   1062a:	6445                	lui	s0,0x11
   1062c:	72040413          	addi	s0,s0,1824 # 11720 <__init_array_end>
   10630:	72878793          	addi	a5,a5,1832 # 11728 <__fini_array_end>
   10634:	8f81                	sub	a5,a5,s0
   10636:	e426                	sd	s1,8(sp)
   10638:	ec06                	sd	ra,24(sp)
   1063a:	4037d493          	srai	s1,a5,0x3
   1063e:	c881                	beqz	s1,1064e <__libc_fini_array+0x2a>
   10640:	17e1                	addi	a5,a5,-8
   10642:	943e                	add	s0,s0,a5
   10644:	601c                	ld	a5,0(s0)
   10646:	14fd                	addi	s1,s1,-1
   10648:	1461                	addi	s0,s0,-8
   1064a:	9782                	jalr	a5
   1064c:	fce5                	bnez	s1,10644 <__libc_fini_array+0x20>
   1064e:	60e2                	ld	ra,24(sp)
   10650:	6442                	ld	s0,16(sp)
   10652:	64a2                	ld	s1,8(sp)
   10654:	6105                	addi	sp,sp,32
   10656:	8082                	ret

0000000000010658 <atexit>:
   10658:	85aa                	mv	a1,a0
   1065a:	4681                	li	a3,0
   1065c:	4601                	li	a2,0
   1065e:	4501                	li	a0,0
   10660:	a009                	j	10662 <__register_exitproc>

0000000000010662 <__register_exitproc>:
   10662:	f481b703          	ld	a4,-184(gp) # 11e70 <_global_impure_ptr>
   10666:	1f873783          	ld	a5,504(a4)
   1066a:	c3b1                	beqz	a5,106ae <__register_exitproc+0x4c>
   1066c:	4798                	lw	a4,8(a5)
   1066e:	487d                	li	a6,31
   10670:	06e84263          	blt	a6,a4,106d4 <__register_exitproc+0x72>
   10674:	c505                	beqz	a0,1069c <__register_exitproc+0x3a>
   10676:	00371813          	slli	a6,a4,0x3
   1067a:	983e                	add	a6,a6,a5
   1067c:	10c83823          	sd	a2,272(a6)
   10680:	3107a883          	lw	a7,784(a5)
   10684:	4605                	li	a2,1
   10686:	00e6163b          	sllw	a2,a2,a4
   1068a:	00c8e8b3          	or	a7,a7,a2
   1068e:	3117a823          	sw	a7,784(a5)
   10692:	20d83823          	sd	a3,528(a6)
   10696:	4689                	li	a3,2
   10698:	02d50063          	beq	a0,a3,106b8 <__register_exitproc+0x56>
   1069c:	00270693          	addi	a3,a4,2
   106a0:	068e                	slli	a3,a3,0x3
   106a2:	2705                	addiw	a4,a4,1
   106a4:	c798                	sw	a4,8(a5)
   106a6:	97b6                	add	a5,a5,a3
   106a8:	e38c                	sd	a1,0(a5)
   106aa:	4501                	li	a0,0
   106ac:	8082                	ret
   106ae:	20070793          	addi	a5,a4,512
   106b2:	1ef73c23          	sd	a5,504(a4)
   106b6:	bf5d                	j	1066c <__register_exitproc+0xa>
   106b8:	3147a683          	lw	a3,788(a5)
   106bc:	4501                	li	a0,0
   106be:	8e55                	or	a2,a2,a3
   106c0:	00270693          	addi	a3,a4,2
   106c4:	068e                	slli	a3,a3,0x3
   106c6:	2705                	addiw	a4,a4,1
   106c8:	30c7aa23          	sw	a2,788(a5)
   106cc:	c798                	sw	a4,8(a5)
   106ce:	97b6                	add	a5,a5,a3
   106d0:	e38c                	sd	a1,0(a5)
   106d2:	8082                	ret
   106d4:	557d                	li	a0,-1
   106d6:	8082                	ret

00000000000106d8 <_exit>:
   106d8:	4581                	li	a1,0
   106da:	4601                	li	a2,0
   106dc:	4681                	li	a3,0
   106de:	4701                	li	a4,0
   106e0:	4781                	li	a5,0
   106e2:	05d00893          	li	a7,93
   106e6:	00000073          	ecall
   106ea:	00054363          	bltz	a0,106f0 <_exit+0x18>
   106ee:	a001                	j	106ee <_exit+0x16>
   106f0:	1141                	addi	sp,sp,-16
   106f2:	e022                	sd	s0,0(sp)
   106f4:	842a                	mv	s0,a0
   106f6:	e406                	sd	ra,8(sp)
   106f8:	4080043b          	negw	s0,s0
   106fc:	008000ef          	jal	ra,10704 <__errno>
   10700:	c100                	sw	s0,0(a0)
   10702:	a001                	j	10702 <_exit+0x2a>

0000000000010704 <__errno>:
   10704:	f581b503          	ld	a0,-168(gp) # 11e80 <_impure_ptr>
   10708:	8082                	ret
