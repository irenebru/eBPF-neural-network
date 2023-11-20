; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@ip_map = dso_local global %struct.bpf_map_def { i32 1, i32 1, i32 16, i32 1024, i32 0 }, section "maps", align 4, !dbg !38
@time_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 8, i32 1024, i32 0 }, section "maps", align 4, !dbg !48
@__const.xdp_neural_network.buf = private unnamed_addr constant [42 x i8] c"Tengo ciberataque en %02X con valores %d\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !50
@llvm.compiler.used = appending global [6 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* bitcast (%struct.bpf_map_def* @time_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_neural_network to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_parser_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_parser_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_packet_parser" !dbg !157 {
  %2 = alloca [4 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !169, metadata !DIExpression()), !dbg !208
  %5 = tail call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !209
  call void @llvm.dbg.value(metadata i64 %5, metadata !170, metadata !DIExpression()), !dbg !208
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !210
  %7 = load i32, i32* %6, align 4, !dbg !210, !tbaa !211
  %8 = zext i32 %7 to i64, !dbg !216
  %9 = inttoptr i64 %8 to i8*, !dbg !217
  call void @llvm.dbg.value(metadata i8* %9, metadata !171, metadata !DIExpression()), !dbg !208
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !218
  %11 = load i32, i32* %10, align 4, !dbg !218, !tbaa !219
  %12 = zext i32 %11 to i64, !dbg !220
  %13 = inttoptr i64 %12 to i8*, !dbg !221
  call void @llvm.dbg.value(metadata i8* %13, metadata !172, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %13, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !173, metadata !DIExpression(DW_OP_deref)), !dbg !208
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !222, metadata !DIExpression()) #7, !dbg !231
  call void @llvm.dbg.value(metadata i8* %9, metadata !229, metadata !DIExpression()) #7, !dbg !231
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !230, metadata !DIExpression()) #7, !dbg !231
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !233, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i8* %9, metadata !243, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !244, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !245, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i8* %13, metadata !246, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i32 14, metadata !247, metadata !DIExpression()) #7, !dbg !256
  %14 = getelementptr i8, i8* %13, i64 14, !dbg !258
  %15 = icmp ugt i8* %14, %9, !dbg !260
  br i1 %15, label %165, label %16, !dbg !261

16:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %13, metadata !246, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i8* %14, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %14, metadata !248, metadata !DIExpression()) #7, !dbg !256
  %17 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !262
  %18 = bitcast i8* %17 to i16*, !dbg !262
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i32 0, metadata !255, metadata !DIExpression()) #7, !dbg !256
  %19 = load i16, i16* %18, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %19, metadata !254, metadata !DIExpression()) #7, !dbg !256
  %20 = inttoptr i64 %8 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %19, metadata !265, metadata !DIExpression()) #7, !dbg !270
  %21 = icmp eq i16 %19, 129, !dbg !276
  %22 = icmp eq i16 %19, -22392, !dbg !277
  %23 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %21) #7
  %24 = or i1 %22, %23, !dbg !277
  %25 = xor i1 %24, true, !dbg !278
  %26 = getelementptr i8, i8* %13, i64 18
  %27 = bitcast i8* %26 to %struct.vlan_hdr*
  %28 = icmp ugt %struct.vlan_hdr* %27, %20
  %29 = select i1 %25, i1 true, i1 %28, !dbg !279
  br i1 %29, label %47, label %30, !dbg !279

30:                                               ; preds = %16
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !256
  %31 = getelementptr i8, i8* %13, i64 16, !dbg !280
  %32 = bitcast i8* %31 to i16*, !dbg !280
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !248, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i32 1, metadata !255, metadata !DIExpression()) #7, !dbg !256
  %33 = load i16, i16* %32, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %33, metadata !254, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i16 %33, metadata !265, metadata !DIExpression()) #7, !dbg !270
  %34 = icmp eq i16 %33, 129, !dbg !276
  %35 = icmp eq i16 %33, -22392, !dbg !277
  %36 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %34) #7
  %37 = or i1 %35, %36, !dbg !277
  %38 = xor i1 %37, true, !dbg !278
  %39 = getelementptr i8, i8* %13, i64 22
  %40 = bitcast i8* %39 to %struct.vlan_hdr*
  %41 = icmp ugt %struct.vlan_hdr* %40, %20
  %42 = select i1 %38, i1 true, i1 %41, !dbg !279
  br i1 %42, label %47, label %43, !dbg !279

43:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !256
  %44 = getelementptr i8, i8* %13, i64 20, !dbg !280
  %45 = bitcast i8* %44 to i16*, !dbg !280
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !248, metadata !DIExpression()) #7, !dbg !256
  call void @llvm.dbg.value(metadata i32 2, metadata !255, metadata !DIExpression()) #7, !dbg !256
  %46 = load i16, i16* %45, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %46, metadata !254, metadata !DIExpression()) #7, !dbg !256
  br label %47

47:                                               ; preds = %16, %30, %43
  %48 = phi i8* [ %14, %16 ], [ %26, %30 ], [ %39, %43 ], !dbg !256
  %49 = phi i16 [ %19, %16 ], [ %33, %30 ], [ %46, %43 ], !dbg !256
  call void @llvm.dbg.value(metadata i8* %48, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i16 %49, metadata !191, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !208
  %50 = icmp eq i16 %49, 8, !dbg !281
  br i1 %50, label %51, label %165, !dbg !282

51:                                               ; preds = %47
  %52 = sub i32 %7, %11, !dbg !283
  call void @llvm.dbg.value(metadata i32 %52, metadata !192, metadata !DIExpression(DW_OP_constu, 14, DW_OP_minus, DW_OP_stack_value)), !dbg !284
  call void @llvm.dbg.value(metadata i8* null, metadata !195, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* null, metadata !196, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* null, metadata !197, metadata !DIExpression()), !dbg !284
  switch i32 %52, label %165 [
    i32 78, label %53
    i32 111, label %65
    i32 116, label %86
    i32 90, label %107
  ], !dbg !285

53:                                               ; preds = %51
  %54 = getelementptr i8, i8* %48, i64 24, !dbg !286
  %55 = icmp ugt i8* %54, %9, !dbg !290
  br i1 %55, label %165, label %56, !dbg !291

56:                                               ; preds = %53
  call void @llvm.dbg.value(metadata i8* %54, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %54, metadata !195, metadata !DIExpression()), !dbg !284
  %57 = getelementptr i8, i8* %48, i64 40, !dbg !292
  %58 = icmp ugt i8* %57, %9, !dbg !294
  br i1 %58, label %165, label %59, !dbg !295

59:                                               ; preds = %56
  %60 = getelementptr i8, i8* %48, i64 57, !dbg !296
  %61 = icmp ugt i8* %60, %9, !dbg !298
  %62 = getelementptr i8, i8* %48, i64 58
  %63 = icmp ugt i8* %62, %9
  %64 = or i1 %61, %63, !dbg !299
  call void @llvm.dbg.value(metadata i8* %60, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %60, metadata !196, metadata !DIExpression()), !dbg !284
  br i1 %64, label %165, label %126, !dbg !299

65:                                               ; preds = %51
  %66 = getelementptr i8, i8* %48, i64 7, !dbg !300
  %67 = icmp ugt i8* %66, %9, !dbg !304
  %68 = getelementptr i8, i8* %48, i64 8
  %69 = icmp ugt i8* %68, %9
  %70 = or i1 %67, %69, !dbg !305
  call void @llvm.dbg.value(metadata i8* %66, metadata !197, metadata !DIExpression()), !dbg !284
  br i1 %70, label %165, label %71, !dbg !305

71:                                               ; preds = %65
  %72 = getelementptr i8, i8* %48, i64 20, !dbg !306
  %73 = icmp ugt i8* %72, %9, !dbg !308
  %74 = getelementptr i8, i8* %48, i64 21
  %75 = icmp ugt i8* %74, %9
  %76 = or i1 %73, %75, !dbg !309
  call void @llvm.dbg.value(metadata i8* %72, metadata !196, metadata !DIExpression()), !dbg !284
  br i1 %76, label %165, label %77, !dbg !309

77:                                               ; preds = %71
  %78 = getelementptr i8, i8* %48, i64 31, !dbg !310
  %79 = icmp ugt i8* %78, %9, !dbg !312
  %80 = getelementptr i8, i8* %48, i64 47
  %81 = icmp ugt i8* %80, %9
  %82 = or i1 %79, %81, !dbg !313
  call void @llvm.dbg.value(metadata i8* %78, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %78, metadata !195, metadata !DIExpression()), !dbg !284
  br i1 %82, label %165, label %83, !dbg !313

83:                                               ; preds = %77
  store i8 -2, i8* %78, align 1, !dbg !314, !tbaa !315
  %84 = getelementptr i8, i8* %48, i64 32, !dbg !316
  store i8 -128, i8* %84, align 1, !dbg !317, !tbaa !315
  %85 = load i8, i8* %66, align 1, !dbg !318, !tbaa !315
  br label %120, !dbg !319

86:                                               ; preds = %51
  %87 = getelementptr i8, i8* %48, i64 13, !dbg !320
  %88 = icmp ugt i8* %87, %9, !dbg !324
  %89 = getelementptr i8, i8* %48, i64 14
  %90 = icmp ugt i8* %89, %9
  %91 = or i1 %88, %90, !dbg !325
  call void @llvm.dbg.value(metadata i8* %87, metadata !197, metadata !DIExpression()), !dbg !284
  br i1 %91, label %165, label %92, !dbg !325

92:                                               ; preds = %86
  %93 = getelementptr i8, i8* %48, i64 25, !dbg !326
  %94 = icmp ugt i8* %93, %9, !dbg !328
  %95 = getelementptr i8, i8* %48, i64 26
  %96 = icmp ugt i8* %95, %9
  %97 = or i1 %94, %96, !dbg !329
  call void @llvm.dbg.value(metadata i8* %93, metadata !196, metadata !DIExpression()), !dbg !284
  br i1 %97, label %165, label %98, !dbg !329

98:                                               ; preds = %92
  %99 = getelementptr i8, i8* %48, i64 36, !dbg !330
  %100 = icmp ugt i8* %99, %9, !dbg !332
  %101 = getelementptr i8, i8* %48, i64 52
  %102 = icmp ugt i8* %101, %9
  %103 = or i1 %100, %102, !dbg !333
  call void @llvm.dbg.value(metadata i8* %99, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %99, metadata !195, metadata !DIExpression()), !dbg !284
  br i1 %103, label %165, label %104, !dbg !333

104:                                              ; preds = %98
  store i8 -2, i8* %99, align 1, !dbg !334, !tbaa !315
  %105 = getelementptr i8, i8* %48, i64 37, !dbg !335
  store i8 -128, i8* %105, align 1, !dbg !336, !tbaa !315
  %106 = load i8, i8* %87, align 1, !dbg !337, !tbaa !315
  br label %120, !dbg !338

107:                                              ; preds = %51
  %108 = getelementptr i8, i8* %48, i64 25, !dbg !339
  %109 = icmp ugt i8* %108, %9, !dbg !343
  %110 = getelementptr i8, i8* %48, i64 26
  %111 = icmp ugt i8* %110, %9
  %112 = or i1 %109, %111, !dbg !344
  call void @llvm.dbg.value(metadata i8* %108, metadata !196, metadata !DIExpression()), !dbg !284
  br i1 %112, label %165, label %113, !dbg !344

113:                                              ; preds = %107
  %114 = getelementptr i8, i8* %48, i64 52, !dbg !345
  %115 = icmp ugt i8* %114, %9, !dbg !347
  %116 = getelementptr i8, i8* %48, i64 68
  %117 = icmp ugt i8* %116, %9
  %118 = or i1 %115, %117, !dbg !348
  call void @llvm.dbg.value(metadata i8* %114, metadata !186, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i8* %114, metadata !195, metadata !DIExpression()), !dbg !284
  br i1 %118, label %165, label %119, !dbg !348

119:                                              ; preds = %113
  store i8 -2, i8* %114, align 1, !dbg !349, !tbaa !315
  br label %120

120:                                              ; preds = %104, %119, %83
  %121 = phi i64 [ 46, %83 ], [ 53, %119 ], [ 51, %104 ]
  %122 = phi i8 [ %85, %83 ], [ -128, %119 ], [ %106, %104 ]
  %123 = phi i8* [ %72, %83 ], [ %108, %119 ], [ %93, %104 ]
  %124 = phi i8* [ %78, %83 ], [ %114, %119 ], [ %99, %104 ]
  %125 = getelementptr i8, i8* %48, i64 %121, !dbg !350
  store i8 %122, i8* %125, align 1, !dbg !350, !tbaa !315
  br label %126, !dbg !351

126:                                              ; preds = %120, %59
  %127 = phi i8* [ %60, %59 ], [ %123, %120 ], !dbg !352
  %128 = phi i8* [ %54, %59 ], [ %124, %120 ], !dbg !352
  call void @llvm.dbg.value(metadata i8* %128, metadata !195, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* %127, metadata !196, metadata !DIExpression()), !dbg !284
  %129 = load i8, i8* %127, align 1, !dbg !351, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %129, metadata !198, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !284
  %130 = getelementptr inbounds i8, i8* %128, i64 15, !dbg !353
  %131 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %130) #7, !dbg !354
  %132 = bitcast i8* %131 to i32*, !dbg !354
  call void @llvm.dbg.value(metadata i32* %132, metadata !199, metadata !DIExpression()), !dbg !284
  %133 = icmp eq i8* %131, null, !dbg !355
  br i1 %133, label %134, label %144, !dbg !356

134:                                              ; preds = %126
  call void @llvm.dbg.value(metadata [4 x i32]* %2, metadata !200, metadata !DIExpression()), !dbg !357
  %135 = icmp ult i8 %129, 4
  %136 = bitcast [4 x i32]* %2 to i8*, !dbg !358
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %136, i8 0, i64 16, i1 false), !dbg !360
  br i1 %135, label %137, label %142, !dbg !358

137:                                              ; preds = %134
  %138 = zext i8 %129 to i64, !dbg !361
  %139 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %138, !dbg !361
  %140 = load i32, i32* %139, align 4, !dbg !362, !tbaa !363
  %141 = add nsw i32 %140, 1, !dbg !362
  store i32 %141, i32* %139, align 4, !dbg !362, !tbaa !363
  br label %142, !dbg !361

142:                                              ; preds = %137, %134
  %143 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %130, i8* noundef nonnull %136, i64 noundef 0) #7, !dbg !364
  br label %165

144:                                              ; preds = %126
  %145 = icmp ult i8 %129, 3
  br i1 %145, label %146, label %151, !dbg !365

146:                                              ; preds = %144
  %147 = zext i8 %129 to i64, !dbg !367
  %148 = getelementptr inbounds i32, i32* %132, i64 %147, !dbg !367
  %149 = load i32, i32* %148, align 4, !dbg !368, !tbaa !363
  %150 = add nsw i32 %149, 1, !dbg !368
  store i32 %150, i32* %148, align 4, !dbg !368, !tbaa !363
  br label %151, !dbg !367

151:                                              ; preds = %146, %144
  %152 = tail call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %130, i8* noundef nonnull %131, i64 noundef 0) #7, !dbg !369
  %153 = bitcast i32* %3 to i8*, !dbg !370
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %153) #7, !dbg !370
  call void @llvm.dbg.value(metadata i32 1, metadata !203, metadata !DIExpression()), !dbg !284
  store i32 1, i32* %3, align 4, !dbg !371, !tbaa !363
  call void @llvm.dbg.value(metadata i32* %3, metadata !203, metadata !DIExpression(DW_OP_deref)), !dbg !284
  %154 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %153) #7, !dbg !372
  call void @llvm.dbg.value(metadata i8* %154, metadata !204, metadata !DIExpression()), !dbg !284
  %155 = call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !373
  call void @llvm.dbg.value(metadata i64 %155, metadata !206, metadata !DIExpression()), !dbg !284
  %156 = bitcast i64* %4 to i8*, !dbg !374
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %156) #7, !dbg !374
  %157 = sub nsw i64 %155, %5, !dbg !375
  call void @llvm.dbg.value(metadata i64 %157, metadata !207, metadata !DIExpression()), !dbg !284
  store i64 %157, i64* %4, align 8, !dbg !376, !tbaa !377
  %158 = icmp eq i8* %154, null, !dbg !379
  br i1 %158, label %163, label %159, !dbg !381

159:                                              ; preds = %151
  %160 = bitcast i8* %154 to i64*, !dbg !372
  call void @llvm.dbg.value(metadata i64* %160, metadata !204, metadata !DIExpression()), !dbg !284
  %161 = load i64, i64* %160, align 8, !dbg !382, !tbaa !377
  %162 = add nsw i64 %161, %157, !dbg !384
  call void @llvm.dbg.value(metadata i64 %162, metadata !207, metadata !DIExpression()), !dbg !284
  store i64 %162, i64* %4, align 8, !dbg !384, !tbaa !377
  call void @llvm.dbg.value(metadata i32* %3, metadata !203, metadata !DIExpression(DW_OP_deref)), !dbg !284
  call void @llvm.dbg.value(metadata i64* %4, metadata !207, metadata !DIExpression(DW_OP_deref)), !dbg !284
  br label %163

163:                                              ; preds = %151, %159
  %164 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %153, i8* noundef nonnull %156, i64 noundef 0) #7, !dbg !385
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %156) #7, !dbg !386
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %153) #7, !dbg !386
  br label %165

165:                                              ; preds = %142, %51, %113, %107, %98, %92, %86, %77, %71, %65, %59, %56, %53, %1, %47, %163
  %166 = phi i32 [ 2, %163 ], [ 2, %47 ], [ 1, %1 ], [ 1, %142 ], [ 1, %51 ], [ 1, %113 ], [ 1, %107 ], [ 1, %98 ], [ 1, %92 ], [ 1, %86 ], [ 1, %77 ], [ 1, %71 ], [ 1, %65 ], [ 1, %59 ], [ 1, %56 ], [ 2, %53 ], !dbg !208
  ret i32 %166, !dbg !387
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_neural_network(%struct.xdp_md* nocapture noundef readonly %0) #0 section "classifier" !dbg !388 {
  %2 = alloca i64, align 8
  %3 = alloca [4 x i32], align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  %9 = alloca [42 x i8], align 1
  %10 = alloca [4 x i32], align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !390, metadata !DIExpression()), !dbg !439
  %13 = bitcast i64* %2 to i8*, !dbg !440
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #7, !dbg !440
  %14 = tail call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !441
  call void @llvm.dbg.value(metadata i64 %14, metadata !391, metadata !DIExpression()), !dbg !439
  store i64 %14, i64* %2, align 8, !dbg !442, !tbaa !377
  %15 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !443
  %16 = load i32, i32* %15, align 4, !dbg !443, !tbaa !211
  %17 = zext i32 %16 to i64, !dbg !444
  %18 = inttoptr i64 %17 to i8*, !dbg !445
  call void @llvm.dbg.value(metadata i8* %18, metadata !392, metadata !DIExpression()), !dbg !439
  %19 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !446
  %20 = load i32, i32* %19, align 4, !dbg !446, !tbaa !219
  %21 = zext i32 %20 to i64, !dbg !447
  %22 = inttoptr i64 %21 to i8*, !dbg !448
  call void @llvm.dbg.value(metadata i8* %22, metadata !393, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %22, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !394, metadata !DIExpression(DW_OP_deref)), !dbg !439
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !222, metadata !DIExpression()) #7, !dbg !449
  call void @llvm.dbg.value(metadata i8* %18, metadata !229, metadata !DIExpression()) #7, !dbg !449
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !230, metadata !DIExpression()) #7, !dbg !449
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !233, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i8* %18, metadata !243, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !244, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !245, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i8* %22, metadata !246, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i32 14, metadata !247, metadata !DIExpression()) #7, !dbg !451
  %23 = getelementptr i8, i8* %22, i64 14, !dbg !453
  %24 = icmp ugt i8* %23, %18, !dbg !454
  br i1 %24, label %1154, label %25, !dbg !455

25:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %22, metadata !246, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i8* %23, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %23, metadata !248, metadata !DIExpression()) #7, !dbg !451
  %26 = getelementptr inbounds i8, i8* %22, i64 12, !dbg !456
  %27 = bitcast i8* %26 to i16*, !dbg !456
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i32 0, metadata !255, metadata !DIExpression()) #7, !dbg !451
  %28 = load i16, i16* %27, align 1, !dbg !451, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %28, metadata !254, metadata !DIExpression()) #7, !dbg !451
  %29 = inttoptr i64 %17 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %28, metadata !265, metadata !DIExpression()) #7, !dbg !457
  %30 = icmp eq i16 %28, 129, !dbg !459
  %31 = icmp eq i16 %28, -22392, !dbg !460
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %30) #7
  %33 = or i1 %31, %32, !dbg !460
  %34 = xor i1 %33, true, !dbg !461
  %35 = getelementptr i8, i8* %22, i64 18
  %36 = bitcast i8* %35 to %struct.vlan_hdr*
  %37 = icmp ugt %struct.vlan_hdr* %36, %29
  %38 = select i1 %34, i1 true, i1 %37, !dbg !462
  br i1 %38, label %56, label %39, !dbg !462

39:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !451
  %40 = getelementptr i8, i8* %22, i64 16, !dbg !463
  %41 = bitcast i8* %40 to i16*, !dbg !463
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %36, metadata !248, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i32 1, metadata !255, metadata !DIExpression()) #7, !dbg !451
  %42 = load i16, i16* %41, align 1, !dbg !451, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %42, metadata !254, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i16 %42, metadata !265, metadata !DIExpression()) #7, !dbg !457
  %43 = icmp eq i16 %42, 129, !dbg !459
  %44 = icmp eq i16 %42, -22392, !dbg !460
  %45 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %43) #7
  %46 = or i1 %44, %45, !dbg !460
  %47 = xor i1 %46, true, !dbg !461
  %48 = getelementptr i8, i8* %22, i64 22
  %49 = bitcast i8* %48 to %struct.vlan_hdr*
  %50 = icmp ugt %struct.vlan_hdr* %49, %29
  %51 = select i1 %47, i1 true, i1 %50, !dbg !462
  br i1 %51, label %56, label %52, !dbg !462

52:                                               ; preds = %39
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #7, !dbg !451
  %53 = getelementptr i8, i8* %22, i64 20, !dbg !463
  %54 = bitcast i8* %53 to i16*, !dbg !463
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %49, metadata !248, metadata !DIExpression()) #7, !dbg !451
  call void @llvm.dbg.value(metadata i32 2, metadata !255, metadata !DIExpression()) #7, !dbg !451
  %55 = load i16, i16* %54, align 1, !dbg !451, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %55, metadata !254, metadata !DIExpression()) #7, !dbg !451
  br label %56

56:                                               ; preds = %25, %39, %52
  %57 = phi i8* [ %23, %25 ], [ %35, %39 ], [ %48, %52 ], !dbg !451
  %58 = phi i16 [ %28, %25 ], [ %42, %39 ], [ %55, %52 ], !dbg !451
  call void @llvm.dbg.value(metadata i8* %57, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i16 %58, metadata !396, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !439
  %59 = icmp eq i16 %58, 8, !dbg !464
  br i1 %59, label %60, label %1154, !dbg !465

60:                                               ; preds = %56
  %61 = sub i32 %16, %20, !dbg !466
  call void @llvm.dbg.value(metadata i32 %61, metadata !397, metadata !DIExpression(DW_OP_constu, 14, DW_OP_minus, DW_OP_stack_value)), !dbg !467
  call void @llvm.dbg.value(metadata i8* null, metadata !400, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.value(metadata i8* null, metadata !401, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.value(metadata i8* null, metadata !402, metadata !DIExpression()), !dbg !467
  switch i32 %61, label %1154 [
    i32 78, label %62
    i32 111, label %74
    i32 116, label %95
    i32 90, label %116
  ], !dbg !468

62:                                               ; preds = %60
  %63 = getelementptr i8, i8* %57, i64 24, !dbg !469
  %64 = icmp ugt i8* %63, %18, !dbg !473
  br i1 %64, label %1154, label %65, !dbg !474

65:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i8* %63, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %63, metadata !400, metadata !DIExpression()), !dbg !467
  %66 = getelementptr i8, i8* %57, i64 40, !dbg !475
  %67 = icmp ugt i8* %66, %18, !dbg !477
  br i1 %67, label %1154, label %68, !dbg !478

68:                                               ; preds = %65
  %69 = getelementptr i8, i8* %57, i64 57, !dbg !479
  %70 = icmp ugt i8* %69, %18, !dbg !481
  %71 = getelementptr i8, i8* %57, i64 58
  %72 = icmp ugt i8* %71, %18
  %73 = or i1 %70, %72, !dbg !482
  call void @llvm.dbg.value(metadata i8* %69, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %69, metadata !401, metadata !DIExpression()), !dbg !467
  br i1 %73, label %1154, label %135, !dbg !482

74:                                               ; preds = %60
  %75 = getelementptr i8, i8* %57, i64 7, !dbg !483
  %76 = icmp ugt i8* %75, %18, !dbg !487
  %77 = getelementptr i8, i8* %57, i64 8
  %78 = icmp ugt i8* %77, %18
  %79 = or i1 %76, %78, !dbg !488
  call void @llvm.dbg.value(metadata i8* %75, metadata !402, metadata !DIExpression()), !dbg !467
  br i1 %79, label %1154, label %80, !dbg !488

80:                                               ; preds = %74
  %81 = getelementptr i8, i8* %57, i64 20, !dbg !489
  %82 = icmp ugt i8* %81, %18, !dbg !491
  %83 = getelementptr i8, i8* %57, i64 21
  %84 = icmp ugt i8* %83, %18
  %85 = or i1 %82, %84, !dbg !492
  call void @llvm.dbg.value(metadata i8* %81, metadata !401, metadata !DIExpression()), !dbg !467
  br i1 %85, label %1154, label %86, !dbg !492

86:                                               ; preds = %80
  %87 = getelementptr i8, i8* %57, i64 31, !dbg !493
  %88 = icmp ugt i8* %87, %18, !dbg !495
  %89 = getelementptr i8, i8* %57, i64 47
  %90 = icmp ugt i8* %89, %18
  %91 = or i1 %88, %90, !dbg !496
  call void @llvm.dbg.value(metadata i8* %87, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %87, metadata !400, metadata !DIExpression()), !dbg !467
  br i1 %91, label %1154, label %92, !dbg !496

92:                                               ; preds = %86
  store i8 -2, i8* %87, align 1, !dbg !497, !tbaa !315
  %93 = getelementptr i8, i8* %57, i64 32, !dbg !498
  store i8 -128, i8* %93, align 1, !dbg !499, !tbaa !315
  %94 = load i8, i8* %75, align 1, !dbg !500, !tbaa !315
  br label %129, !dbg !501

95:                                               ; preds = %60
  %96 = getelementptr i8, i8* %57, i64 13, !dbg !502
  %97 = icmp ugt i8* %96, %18, !dbg !506
  %98 = getelementptr i8, i8* %57, i64 14
  %99 = icmp ugt i8* %98, %18
  %100 = or i1 %97, %99, !dbg !507
  call void @llvm.dbg.value(metadata i8* %96, metadata !402, metadata !DIExpression()), !dbg !467
  br i1 %100, label %1154, label %101, !dbg !507

101:                                              ; preds = %95
  %102 = getelementptr i8, i8* %57, i64 25, !dbg !508
  %103 = icmp ugt i8* %102, %18, !dbg !510
  %104 = getelementptr i8, i8* %57, i64 26
  %105 = icmp ugt i8* %104, %18
  %106 = or i1 %103, %105, !dbg !511
  call void @llvm.dbg.value(metadata i8* %102, metadata !401, metadata !DIExpression()), !dbg !467
  br i1 %106, label %1154, label %107, !dbg !511

107:                                              ; preds = %101
  %108 = getelementptr i8, i8* %57, i64 36, !dbg !512
  %109 = icmp ugt i8* %108, %18, !dbg !514
  %110 = getelementptr i8, i8* %57, i64 52
  %111 = icmp ugt i8* %110, %18
  %112 = or i1 %109, %111, !dbg !515
  call void @llvm.dbg.value(metadata i8* %108, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %108, metadata !400, metadata !DIExpression()), !dbg !467
  br i1 %112, label %1154, label %113, !dbg !515

113:                                              ; preds = %107
  store i8 -2, i8* %108, align 1, !dbg !516, !tbaa !315
  %114 = getelementptr i8, i8* %57, i64 37, !dbg !517
  store i8 -128, i8* %114, align 1, !dbg !518, !tbaa !315
  %115 = load i8, i8* %96, align 1, !dbg !519, !tbaa !315
  br label %129, !dbg !520

116:                                              ; preds = %60
  %117 = getelementptr i8, i8* %57, i64 25, !dbg !521
  %118 = icmp ugt i8* %117, %18, !dbg !525
  %119 = getelementptr i8, i8* %57, i64 26
  %120 = icmp ugt i8* %119, %18
  %121 = or i1 %118, %120, !dbg !526
  call void @llvm.dbg.value(metadata i8* %117, metadata !401, metadata !DIExpression()), !dbg !467
  br i1 %121, label %1154, label %122, !dbg !526

122:                                              ; preds = %116
  %123 = getelementptr i8, i8* %57, i64 52, !dbg !527
  %124 = icmp ugt i8* %123, %18, !dbg !529
  %125 = getelementptr i8, i8* %57, i64 68
  %126 = icmp ugt i8* %125, %18
  %127 = or i1 %124, %126, !dbg !530
  call void @llvm.dbg.value(metadata i8* %123, metadata !395, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i8* %123, metadata !400, metadata !DIExpression()), !dbg !467
  br i1 %127, label %1154, label %128, !dbg !530

128:                                              ; preds = %122
  store i8 -2, i8* %123, align 1, !dbg !531, !tbaa !315
  br label %129

129:                                              ; preds = %113, %128, %92
  %130 = phi i64 [ 46, %92 ], [ 53, %128 ], [ 51, %113 ]
  %131 = phi i8 [ %94, %92 ], [ -128, %128 ], [ %115, %113 ]
  %132 = phi i8* [ %81, %92 ], [ %117, %128 ], [ %102, %113 ]
  %133 = phi i8* [ %87, %92 ], [ %123, %128 ], [ %108, %113 ]
  %134 = getelementptr i8, i8* %57, i64 %130, !dbg !532
  store i8 %131, i8* %134, align 1, !dbg !532, !tbaa !315
  br label %135, !dbg !533

135:                                              ; preds = %129, %68
  %136 = phi i8* [ %69, %68 ], [ %132, %129 ], !dbg !534
  %137 = phi i8* [ %63, %68 ], [ %133, %129 ], !dbg !534
  call void @llvm.dbg.value(metadata i8* %137, metadata !400, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.value(metadata i8* %136, metadata !401, metadata !DIExpression()), !dbg !467
  %138 = load i8, i8* %136, align 1, !dbg !533, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %138, metadata !403, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !467
  %139 = getelementptr inbounds i8, i8* %137, i64 15, !dbg !535
  %140 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %139) #7, !dbg !536
  %141 = bitcast i8* %140 to i32*, !dbg !536
  call void @llvm.dbg.value(metadata i32* %141, metadata !404, metadata !DIExpression()), !dbg !467
  %142 = icmp eq i8* %140, null, !dbg !537
  br i1 %142, label %143, label %154, !dbg !538

143:                                              ; preds = %135
  call void @llvm.dbg.value(metadata [4 x i32]* %3, metadata !405, metadata !DIExpression()), !dbg !539
  %144 = icmp ult i8 %138, 4
  %145 = bitcast [4 x i32]* %3 to i8*, !dbg !540
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %145, i8 0, i64 16, i1 false), !dbg !542
  br i1 %144, label %146, label %151, !dbg !540

146:                                              ; preds = %143
  %147 = zext i8 %138 to i64, !dbg !543
  %148 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %147, !dbg !543
  %149 = load i32, i32* %148, align 4, !dbg !544, !tbaa !363
  %150 = add nsw i32 %149, 1, !dbg !544
  store i32 %150, i32* %148, align 4, !dbg !544, !tbaa !363
  br label %151, !dbg !543

151:                                              ; preds = %146, %143
  %152 = bitcast [4 x i32]* %3 to i8*, !dbg !545
  %153 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %139, i8* noundef nonnull %152, i64 noundef 0) #7, !dbg !546
  br label %1154

154:                                              ; preds = %135
  %155 = icmp ult i8 %138, 3
  br i1 %155, label %156, label %161, !dbg !547

156:                                              ; preds = %154
  %157 = zext i8 %138 to i64, !dbg !549
  %158 = getelementptr inbounds i32, i32* %141, i64 %157, !dbg !549
  %159 = load i32, i32* %158, align 4, !dbg !550, !tbaa !363
  %160 = add nsw i32 %159, 1, !dbg !550
  store i32 %160, i32* %158, align 4, !dbg !550, !tbaa !363
  br label %161, !dbg !549

161:                                              ; preds = %156, %154
  %162 = tail call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %139, i8* noundef nonnull %140, i64 noundef 0) #7, !dbg !551
  %163 = bitcast i32* %4 to i8*, !dbg !552
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %163) #7, !dbg !552
  call void @llvm.dbg.value(metadata i32 1, metadata !408, metadata !DIExpression()), !dbg !467
  store i32 1, i32* %4, align 4, !dbg !553, !tbaa !363
  call void @llvm.dbg.value(metadata i32* %4, metadata !408, metadata !DIExpression(DW_OP_deref)), !dbg !467
  %164 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %163) #7, !dbg !554
  call void @llvm.dbg.value(metadata i8* %164, metadata !409, metadata !DIExpression()), !dbg !467
  %165 = bitcast i64* %5 to i8*, !dbg !555
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %165) #7, !dbg !555
  %166 = call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !556
  call void @llvm.dbg.value(metadata i64 %166, metadata !410, metadata !DIExpression()), !dbg !467
  store i64 %166, i64* %5, align 8, !dbg !557, !tbaa !377
  %167 = bitcast i64* %6 to i8*, !dbg !558
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %167) #7, !dbg !558
  %168 = load i64, i64* %2, align 8, !dbg !559, !tbaa !377
  call void @llvm.dbg.value(metadata i64 %168, metadata !391, metadata !DIExpression()), !dbg !439
  %169 = sub nsw i64 %166, %168, !dbg !560
  call void @llvm.dbg.value(metadata i64 %169, metadata !411, metadata !DIExpression()), !dbg !467
  store i64 %169, i64* %6, align 8, !dbg !561, !tbaa !377
  %170 = icmp eq i8* %164, null, !dbg !562
  br i1 %170, label %175, label %171, !dbg !564

171:                                              ; preds = %161
  %172 = bitcast i8* %164 to i64*, !dbg !554
  call void @llvm.dbg.value(metadata i64* %172, metadata !409, metadata !DIExpression()), !dbg !467
  %173 = load i64, i64* %172, align 8, !dbg !565, !tbaa !377
  %174 = add nsw i64 %173, %169, !dbg !567
  call void @llvm.dbg.value(metadata i64 %174, metadata !411, metadata !DIExpression()), !dbg !467
  store i64 %174, i64* %6, align 8, !dbg !567, !tbaa !377
  call void @llvm.dbg.value(metadata i32* %4, metadata !408, metadata !DIExpression(DW_OP_deref)), !dbg !467
  call void @llvm.dbg.value(metadata i64* %6, metadata !411, metadata !DIExpression(DW_OP_deref)), !dbg !467
  br label %175

175:                                              ; preds = %161, %171
  %176 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %163, i8* noundef nonnull %167, i64 noundef 0) #7, !dbg !568
  %177 = bitcast i32* %7 to i8*, !dbg !569
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %177) #7, !dbg !569
  call void @llvm.dbg.value(metadata i32 0, metadata !412, metadata !DIExpression()), !dbg !467
  store i32 0, i32* %7, align 4, !dbg !570, !tbaa !363
  call void @llvm.dbg.value(metadata i32* %7, metadata !412, metadata !DIExpression(DW_OP_deref)), !dbg !467
  %178 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %177) #7, !dbg !571
  call void @llvm.dbg.value(metadata i8* %178, metadata !413, metadata !DIExpression()), !dbg !467
  %179 = icmp eq i8* %178, null, !dbg !572
  br i1 %179, label %180, label %182, !dbg !573

180:                                              ; preds = %175
  call void @llvm.dbg.value(metadata i64* %2, metadata !391, metadata !DIExpression(DW_OP_deref)), !dbg !439
  call void @llvm.dbg.value(metadata i32* %7, metadata !412, metadata !DIExpression(DW_OP_deref)), !dbg !467
  %181 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %177, i8* noundef nonnull %13, i64 noundef 0) #7, !dbg !574
  br label %1153, !dbg !576

182:                                              ; preds = %175
  %183 = bitcast i8* %178 to i64*, !dbg !571
  call void @llvm.dbg.value(metadata i64* %183, metadata !413, metadata !DIExpression()), !dbg !467
  %184 = load i64, i64* %5, align 8, !dbg !577, !tbaa !377
  call void @llvm.dbg.value(metadata i64 %184, metadata !410, metadata !DIExpression()), !dbg !467
  %185 = load i64, i64* %183, align 8, !dbg !578, !tbaa !377
  %186 = sub nsw i64 %184, %185, !dbg !579
  %187 = icmp sgt i64 %186, 4999999999, !dbg !580
  br i1 %187, label %188, label %1153, !dbg !581

188:                                              ; preds = %182
  call void @llvm.dbg.value(metadata i64* %5, metadata !410, metadata !DIExpression(DW_OP_deref)), !dbg !467
  call void @llvm.dbg.value(metadata i32* %7, metadata !412, metadata !DIExpression(DW_OP_deref)), !dbg !467
  %189 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %177, i8* noundef nonnull %165, i64 noundef 0) #7, !dbg !582
  %190 = call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !583
  call void @llvm.dbg.value(metadata i64 %190, metadata !414, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !418, metadata !DIExpression()), !dbg !585
  %191 = getelementptr inbounds [42 x i8], [42 x i8]* %9, i64 0, i64 0
  %192 = bitcast [4 x i32]* %10 to i8*
  call void @llvm.dbg.value(metadata i64 0, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 2, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 2, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %193 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %194 = bitcast i8* %193 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %194, metadata !423, metadata !DIExpression()), !dbg !587
  %195 = icmp eq i8* %193, null, !dbg !590
  br i1 %195, label %269, label %196, !dbg !591

196:                                              ; preds = %188
  %197 = getelementptr inbounds i8, i8* %193, i64 4, !dbg !592
  %198 = bitcast i8* %197 to i32*, !dbg !592
  %199 = load i32, i32* %198, align 4, !dbg !592, !tbaa !363
  %200 = load i32, i32* %194, align 4, !dbg !593, !tbaa !363
  %201 = getelementptr inbounds i8, i8* %193, i64 8, !dbg !594
  %202 = bitcast i8* %201 to i32*, !dbg !594
  %203 = load i32, i32* %202, align 4, !dbg !594, !tbaa !363
  %204 = getelementptr inbounds i8, i8* %193, i64 12, !dbg !595
  %205 = bitcast i8* %204 to i32*, !dbg !595
  %206 = load i32, i32* %205, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %199, metadata !605, metadata !DIExpression()), !dbg !612
  %207 = shl i32 %199, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %207, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %207, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %207, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %200, metadata !605, metadata !DIExpression()), !dbg !615
  %208 = shl i32 %200, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %208, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %208, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %208, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %203, metadata !605, metadata !DIExpression()), !dbg !618
  %209 = shl i32 %203, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %209, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %209, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %209, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %206, metadata !605, metadata !DIExpression()), !dbg !621
  %210 = shl i32 %206, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %210, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %210, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %210, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %207, metadata !684, metadata !DIExpression()), !dbg !686
  %211 = sext i32 %207 to i64, !dbg !690
  %212 = mul nsw i64 %211, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %212, metadata !685, metadata !DIExpression()), !dbg !686
  %213 = lshr exact i64 %212, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %212, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %214 = trunc i64 %213 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %214, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %208, metadata !684, metadata !DIExpression()), !dbg !686
  %215 = sext i32 %208 to i64, !dbg !690
  %216 = mul nsw i64 %215, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %216, metadata !685, metadata !DIExpression()), !dbg !686
  %217 = lshr exact i64 %216, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %216, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %218 = trunc i64 %217 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %209, metadata !684, metadata !DIExpression()), !dbg !686
  %219 = sext i32 %209 to i64, !dbg !690
  %220 = mul nsw i64 %219, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %220, metadata !685, metadata !DIExpression()), !dbg !686
  %221 = lshr exact i64 %220, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %220, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %222 = trunc i64 %221 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %210, metadata !684, metadata !DIExpression()), !dbg !686
  %223 = sext i32 %210 to i64, !dbg !690
  %224 = mul nsw i64 %223, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %224, metadata !685, metadata !DIExpression()), !dbg !686
  %225 = lshr exact i64 %224, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %224, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %226 = trunc i64 %225 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %227 = add i32 %214, 43371, !dbg !694
  %228 = add i32 %227, %218, !dbg !694
  %229 = add i32 %228, %222, !dbg !694
  %230 = add i32 %229, %226, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %207, metadata !684, metadata !DIExpression()), !dbg !686
  %231 = mul nsw i64 %211, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %231, metadata !685, metadata !DIExpression()), !dbg !686
  %232 = lshr exact i64 %231, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %231, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %233 = trunc i64 %232 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %233, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %208, metadata !684, metadata !DIExpression()), !dbg !686
  %234 = mul nsw i64 %215, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %234, metadata !685, metadata !DIExpression()), !dbg !686
  %235 = lshr exact i64 %234, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %234, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %236 = trunc i64 %235 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %209, metadata !684, metadata !DIExpression()), !dbg !686
  %237 = mul nsw i64 %219, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %237, metadata !685, metadata !DIExpression()), !dbg !686
  %238 = lshr exact i64 %237, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %237, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %239 = trunc i64 %238 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %210, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %240 = add i32 %233, -10468, !dbg !694
  %241 = add i32 %240, %236, !dbg !694
  %242 = add i32 %241, %239, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %243 = icmp sgt i32 %230, 0
  %244 = select i1 %243, i32 %230, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %245 = icmp sgt i32 %242, 0
  %246 = select i1 %245, i32 %242, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %244, metadata !684, metadata !DIExpression()), !dbg !704
  %247 = zext i32 %244 to i64, !dbg !706
  %248 = mul nuw nsw i64 %247, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %248, metadata !685, metadata !DIExpression()), !dbg !704
  %249 = lshr i64 %248, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %248, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %250 = trunc i64 %249 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %250, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %246, metadata !684, metadata !DIExpression()), !dbg !704
  %251 = zext i32 %246 to i64, !dbg !706
  %252 = mul nsw i64 %251, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %252, metadata !685, metadata !DIExpression()), !dbg !704
  %253 = lshr i64 %252, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %252, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %254 = trunc i64 %253 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %255 = add i32 %250, 9674, !dbg !710
  %256 = add i32 %255, %254, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %257 = icmp sgt i32 %256, 0
  %258 = select i1 %257, i32 %256, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %258, metadata !684, metadata !DIExpression()), !dbg !719
  %259 = zext i32 %258 to i64, !dbg !721
  %260 = mul nsw i64 %259, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %260, metadata !685, metadata !DIExpression()), !dbg !719
  %261 = lshr i64 %260, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %260, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %262 = trunc i64 %261 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %262, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %262, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %262, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %263 = icmp sgt i32 %262, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %263, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %263, label %264, label %269, !dbg !728

264:                                              ; preds = %196
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %265 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %265, metadata !420, metadata !DIExpression()), !dbg !587
  %266 = zext i8 %265 to i32, !dbg !731
  %267 = load i32, i32* %194, align 4, !dbg !732, !tbaa !363
  %268 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %266, i32 noundef %267) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %269, !dbg !735

269:                                              ; preds = %196, %264, %188
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %270 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %270, i8 0, i64 16, i1 false), !dbg !737
  %271 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 1, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 1, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 6, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 6, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %272 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %273 = bitcast i8* %272 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %273, metadata !423, metadata !DIExpression()), !dbg !587
  %274 = icmp eq i8* %272, null, !dbg !590
  br i1 %274, label %348, label %275, !dbg !591

275:                                              ; preds = %269
  %276 = getelementptr inbounds i8, i8* %272, i64 4, !dbg !592
  %277 = bitcast i8* %276 to i32*, !dbg !592
  %278 = load i32, i32* %277, align 4, !dbg !592, !tbaa !363
  %279 = load i32, i32* %273, align 4, !dbg !593, !tbaa !363
  %280 = getelementptr inbounds i8, i8* %272, i64 8, !dbg !594
  %281 = bitcast i8* %280 to i32*, !dbg !594
  %282 = load i32, i32* %281, align 4, !dbg !594, !tbaa !363
  %283 = getelementptr inbounds i8, i8* %272, i64 12, !dbg !595
  %284 = bitcast i8* %283 to i32*, !dbg !595
  %285 = load i32, i32* %284, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %278, metadata !605, metadata !DIExpression()), !dbg !612
  %286 = shl i32 %278, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %286, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %286, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %286, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %279, metadata !605, metadata !DIExpression()), !dbg !615
  %287 = shl i32 %279, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %287, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %287, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %287, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %282, metadata !605, metadata !DIExpression()), !dbg !618
  %288 = shl i32 %282, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %288, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %288, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %288, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %285, metadata !605, metadata !DIExpression()), !dbg !621
  %289 = shl i32 %285, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %289, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %289, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %289, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %286, metadata !684, metadata !DIExpression()), !dbg !686
  %290 = sext i32 %286 to i64, !dbg !690
  %291 = mul nsw i64 %290, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %291, metadata !685, metadata !DIExpression()), !dbg !686
  %292 = lshr exact i64 %291, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %291, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %293 = trunc i64 %292 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %293, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %287, metadata !684, metadata !DIExpression()), !dbg !686
  %294 = sext i32 %287 to i64, !dbg !690
  %295 = mul nsw i64 %294, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %295, metadata !685, metadata !DIExpression()), !dbg !686
  %296 = lshr exact i64 %295, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %295, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %297 = trunc i64 %296 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %288, metadata !684, metadata !DIExpression()), !dbg !686
  %298 = sext i32 %288 to i64, !dbg !690
  %299 = mul nsw i64 %298, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %299, metadata !685, metadata !DIExpression()), !dbg !686
  %300 = lshr exact i64 %299, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %299, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %301 = trunc i64 %300 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %289, metadata !684, metadata !DIExpression()), !dbg !686
  %302 = sext i32 %289 to i64, !dbg !690
  %303 = mul nsw i64 %302, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %303, metadata !685, metadata !DIExpression()), !dbg !686
  %304 = lshr exact i64 %303, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %303, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %305 = trunc i64 %304 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %306 = add i32 %293, 43371, !dbg !694
  %307 = add i32 %306, %297, !dbg !694
  %308 = add i32 %307, %301, !dbg !694
  %309 = add i32 %308, %305, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %286, metadata !684, metadata !DIExpression()), !dbg !686
  %310 = mul nsw i64 %290, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %310, metadata !685, metadata !DIExpression()), !dbg !686
  %311 = lshr exact i64 %310, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %310, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %312 = trunc i64 %311 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %312, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %287, metadata !684, metadata !DIExpression()), !dbg !686
  %313 = mul nsw i64 %294, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %313, metadata !685, metadata !DIExpression()), !dbg !686
  %314 = lshr exact i64 %313, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %313, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %315 = trunc i64 %314 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %288, metadata !684, metadata !DIExpression()), !dbg !686
  %316 = mul nsw i64 %298, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %316, metadata !685, metadata !DIExpression()), !dbg !686
  %317 = lshr exact i64 %316, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %316, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %318 = trunc i64 %317 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %289, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %319 = add i32 %312, -10468, !dbg !694
  %320 = add i32 %319, %315, !dbg !694
  %321 = add i32 %320, %318, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %322 = icmp sgt i32 %309, 0
  %323 = select i1 %322, i32 %309, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %324 = icmp sgt i32 %321, 0
  %325 = select i1 %324, i32 %321, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %323, metadata !684, metadata !DIExpression()), !dbg !704
  %326 = zext i32 %323 to i64, !dbg !706
  %327 = mul nuw nsw i64 %326, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %327, metadata !685, metadata !DIExpression()), !dbg !704
  %328 = lshr i64 %327, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %327, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %329 = trunc i64 %328 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %329, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %325, metadata !684, metadata !DIExpression()), !dbg !704
  %330 = zext i32 %325 to i64, !dbg !706
  %331 = mul nsw i64 %330, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %331, metadata !685, metadata !DIExpression()), !dbg !704
  %332 = lshr i64 %331, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %331, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %333 = trunc i64 %332 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %334 = add i32 %329, 9674, !dbg !710
  %335 = add i32 %334, %333, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %336 = icmp sgt i32 %335, 0
  %337 = select i1 %336, i32 %335, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %337, metadata !684, metadata !DIExpression()), !dbg !719
  %338 = zext i32 %337 to i64, !dbg !721
  %339 = mul nsw i64 %338, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %339, metadata !685, metadata !DIExpression()), !dbg !719
  %340 = lshr i64 %339, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %339, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %341 = trunc i64 %340 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %341, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %341, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %341, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %342 = icmp sgt i32 %341, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %342, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %342, label %343, label %348, !dbg !728

343:                                              ; preds = %275
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %344 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %344, metadata !420, metadata !DIExpression()), !dbg !587
  %345 = zext i8 %344 to i32, !dbg !731
  %346 = load i32, i32* %273, align 4, !dbg !732, !tbaa !363
  %347 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %345, i32 noundef %346) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %348, !dbg !735

348:                                              ; preds = %343, %275, %269
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %349 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %349, i8 0, i64 16, i1 false), !dbg !737
  %350 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 2, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 2, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 12, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 12, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %351 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %352 = bitcast i8* %351 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %352, metadata !423, metadata !DIExpression()), !dbg !587
  %353 = icmp eq i8* %351, null, !dbg !590
  br i1 %353, label %427, label %354, !dbg !591

354:                                              ; preds = %348
  %355 = getelementptr inbounds i8, i8* %351, i64 4, !dbg !592
  %356 = bitcast i8* %355 to i32*, !dbg !592
  %357 = load i32, i32* %356, align 4, !dbg !592, !tbaa !363
  %358 = load i32, i32* %352, align 4, !dbg !593, !tbaa !363
  %359 = getelementptr inbounds i8, i8* %351, i64 8, !dbg !594
  %360 = bitcast i8* %359 to i32*, !dbg !594
  %361 = load i32, i32* %360, align 4, !dbg !594, !tbaa !363
  %362 = getelementptr inbounds i8, i8* %351, i64 12, !dbg !595
  %363 = bitcast i8* %362 to i32*, !dbg !595
  %364 = load i32, i32* %363, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %357, metadata !605, metadata !DIExpression()), !dbg !612
  %365 = shl i32 %357, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %365, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %365, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %365, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %358, metadata !605, metadata !DIExpression()), !dbg !615
  %366 = shl i32 %358, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %366, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %366, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %366, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %361, metadata !605, metadata !DIExpression()), !dbg !618
  %367 = shl i32 %361, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %367, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %367, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %367, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %364, metadata !605, metadata !DIExpression()), !dbg !621
  %368 = shl i32 %364, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %368, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %368, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %368, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %365, metadata !684, metadata !DIExpression()), !dbg !686
  %369 = sext i32 %365 to i64, !dbg !690
  %370 = mul nsw i64 %369, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %370, metadata !685, metadata !DIExpression()), !dbg !686
  %371 = lshr exact i64 %370, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %370, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %372 = trunc i64 %371 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %372, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %366, metadata !684, metadata !DIExpression()), !dbg !686
  %373 = sext i32 %366 to i64, !dbg !690
  %374 = mul nsw i64 %373, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %374, metadata !685, metadata !DIExpression()), !dbg !686
  %375 = lshr exact i64 %374, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %374, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %376 = trunc i64 %375 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %367, metadata !684, metadata !DIExpression()), !dbg !686
  %377 = sext i32 %367 to i64, !dbg !690
  %378 = mul nsw i64 %377, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %378, metadata !685, metadata !DIExpression()), !dbg !686
  %379 = lshr exact i64 %378, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %378, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %380 = trunc i64 %379 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %368, metadata !684, metadata !DIExpression()), !dbg !686
  %381 = sext i32 %368 to i64, !dbg !690
  %382 = mul nsw i64 %381, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %382, metadata !685, metadata !DIExpression()), !dbg !686
  %383 = lshr exact i64 %382, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %382, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %384 = trunc i64 %383 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %385 = add i32 %372, 43371, !dbg !694
  %386 = add i32 %385, %376, !dbg !694
  %387 = add i32 %386, %380, !dbg !694
  %388 = add i32 %387, %384, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %365, metadata !684, metadata !DIExpression()), !dbg !686
  %389 = mul nsw i64 %369, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %389, metadata !685, metadata !DIExpression()), !dbg !686
  %390 = lshr exact i64 %389, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %389, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %391 = trunc i64 %390 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %391, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %366, metadata !684, metadata !DIExpression()), !dbg !686
  %392 = mul nsw i64 %373, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %392, metadata !685, metadata !DIExpression()), !dbg !686
  %393 = lshr exact i64 %392, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %392, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %394 = trunc i64 %393 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %367, metadata !684, metadata !DIExpression()), !dbg !686
  %395 = mul nsw i64 %377, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %395, metadata !685, metadata !DIExpression()), !dbg !686
  %396 = lshr exact i64 %395, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %395, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %397 = trunc i64 %396 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %368, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %398 = add i32 %391, -10468, !dbg !694
  %399 = add i32 %398, %394, !dbg !694
  %400 = add i32 %399, %397, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %401 = icmp sgt i32 %388, 0
  %402 = select i1 %401, i32 %388, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %403 = icmp sgt i32 %400, 0
  %404 = select i1 %403, i32 %400, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %402, metadata !684, metadata !DIExpression()), !dbg !704
  %405 = zext i32 %402 to i64, !dbg !706
  %406 = mul nuw nsw i64 %405, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %406, metadata !685, metadata !DIExpression()), !dbg !704
  %407 = lshr i64 %406, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %406, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %408 = trunc i64 %407 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %408, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %404, metadata !684, metadata !DIExpression()), !dbg !704
  %409 = zext i32 %404 to i64, !dbg !706
  %410 = mul nsw i64 %409, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %410, metadata !685, metadata !DIExpression()), !dbg !704
  %411 = lshr i64 %410, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %410, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %412 = trunc i64 %411 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %413 = add i32 %408, 9674, !dbg !710
  %414 = add i32 %413, %412, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %415 = icmp sgt i32 %414, 0
  %416 = select i1 %415, i32 %414, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %416, metadata !684, metadata !DIExpression()), !dbg !719
  %417 = zext i32 %416 to i64, !dbg !721
  %418 = mul nsw i64 %417, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %418, metadata !685, metadata !DIExpression()), !dbg !719
  %419 = lshr i64 %418, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %418, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %420 = trunc i64 %419 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %420, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %420, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %420, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %421 = icmp sgt i32 %420, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %421, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %421, label %422, label %427, !dbg !728

422:                                              ; preds = %354
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %423 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %423, metadata !420, metadata !DIExpression()), !dbg !587
  %424 = zext i8 %423 to i32, !dbg !731
  %425 = load i32, i32* %352, align 4, !dbg !732, !tbaa !363
  %426 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %424, i32 noundef %425) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %427, !dbg !735

427:                                              ; preds = %422, %354, %348
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %428 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %428, i8 0, i64 16, i1 false), !dbg !737
  %429 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 3, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 3, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 9, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 9, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %430 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %431 = bitcast i8* %430 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %431, metadata !423, metadata !DIExpression()), !dbg !587
  %432 = icmp eq i8* %430, null, !dbg !590
  br i1 %432, label %506, label %433, !dbg !591

433:                                              ; preds = %427
  %434 = getelementptr inbounds i8, i8* %430, i64 4, !dbg !592
  %435 = bitcast i8* %434 to i32*, !dbg !592
  %436 = load i32, i32* %435, align 4, !dbg !592, !tbaa !363
  %437 = load i32, i32* %431, align 4, !dbg !593, !tbaa !363
  %438 = getelementptr inbounds i8, i8* %430, i64 8, !dbg !594
  %439 = bitcast i8* %438 to i32*, !dbg !594
  %440 = load i32, i32* %439, align 4, !dbg !594, !tbaa !363
  %441 = getelementptr inbounds i8, i8* %430, i64 12, !dbg !595
  %442 = bitcast i8* %441 to i32*, !dbg !595
  %443 = load i32, i32* %442, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %436, metadata !605, metadata !DIExpression()), !dbg !612
  %444 = shl i32 %436, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %444, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %444, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %444, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %437, metadata !605, metadata !DIExpression()), !dbg !615
  %445 = shl i32 %437, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %445, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %445, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %445, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %440, metadata !605, metadata !DIExpression()), !dbg !618
  %446 = shl i32 %440, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %446, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %446, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %446, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %443, metadata !605, metadata !DIExpression()), !dbg !621
  %447 = shl i32 %443, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %447, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %447, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %447, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %444, metadata !684, metadata !DIExpression()), !dbg !686
  %448 = sext i32 %444 to i64, !dbg !690
  %449 = mul nsw i64 %448, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %449, metadata !685, metadata !DIExpression()), !dbg !686
  %450 = lshr exact i64 %449, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %449, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %451 = trunc i64 %450 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %451, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %445, metadata !684, metadata !DIExpression()), !dbg !686
  %452 = sext i32 %445 to i64, !dbg !690
  %453 = mul nsw i64 %452, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %453, metadata !685, metadata !DIExpression()), !dbg !686
  %454 = lshr exact i64 %453, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %453, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %455 = trunc i64 %454 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %446, metadata !684, metadata !DIExpression()), !dbg !686
  %456 = sext i32 %446 to i64, !dbg !690
  %457 = mul nsw i64 %456, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %457, metadata !685, metadata !DIExpression()), !dbg !686
  %458 = lshr exact i64 %457, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %457, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %459 = trunc i64 %458 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %447, metadata !684, metadata !DIExpression()), !dbg !686
  %460 = sext i32 %447 to i64, !dbg !690
  %461 = mul nsw i64 %460, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %461, metadata !685, metadata !DIExpression()), !dbg !686
  %462 = lshr exact i64 %461, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %461, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %463 = trunc i64 %462 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %464 = add i32 %451, 43371, !dbg !694
  %465 = add i32 %464, %455, !dbg !694
  %466 = add i32 %465, %459, !dbg !694
  %467 = add i32 %466, %463, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %444, metadata !684, metadata !DIExpression()), !dbg !686
  %468 = mul nsw i64 %448, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %468, metadata !685, metadata !DIExpression()), !dbg !686
  %469 = lshr exact i64 %468, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %468, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %470 = trunc i64 %469 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %470, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %445, metadata !684, metadata !DIExpression()), !dbg !686
  %471 = mul nsw i64 %452, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %471, metadata !685, metadata !DIExpression()), !dbg !686
  %472 = lshr exact i64 %471, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %471, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %473 = trunc i64 %472 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %446, metadata !684, metadata !DIExpression()), !dbg !686
  %474 = mul nsw i64 %456, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %474, metadata !685, metadata !DIExpression()), !dbg !686
  %475 = lshr exact i64 %474, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %474, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %476 = trunc i64 %475 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %447, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %477 = add i32 %470, -10468, !dbg !694
  %478 = add i32 %477, %473, !dbg !694
  %479 = add i32 %478, %476, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %480 = icmp sgt i32 %467, 0
  %481 = select i1 %480, i32 %467, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %482 = icmp sgt i32 %479, 0
  %483 = select i1 %482, i32 %479, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %481, metadata !684, metadata !DIExpression()), !dbg !704
  %484 = zext i32 %481 to i64, !dbg !706
  %485 = mul nuw nsw i64 %484, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %485, metadata !685, metadata !DIExpression()), !dbg !704
  %486 = lshr i64 %485, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %485, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %487 = trunc i64 %486 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %487, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %483, metadata !684, metadata !DIExpression()), !dbg !704
  %488 = zext i32 %483 to i64, !dbg !706
  %489 = mul nsw i64 %488, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %489, metadata !685, metadata !DIExpression()), !dbg !704
  %490 = lshr i64 %489, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %489, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %491 = trunc i64 %490 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %492 = add i32 %487, 9674, !dbg !710
  %493 = add i32 %492, %491, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %494 = icmp sgt i32 %493, 0
  %495 = select i1 %494, i32 %493, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %495, metadata !684, metadata !DIExpression()), !dbg !719
  %496 = zext i32 %495 to i64, !dbg !721
  %497 = mul nsw i64 %496, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %497, metadata !685, metadata !DIExpression()), !dbg !719
  %498 = lshr i64 %497, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %497, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %499 = trunc i64 %498 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %499, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %499, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %499, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %500 = icmp sgt i32 %499, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %500, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %500, label %501, label %506, !dbg !728

501:                                              ; preds = %433
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %502 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %502, metadata !420, metadata !DIExpression()), !dbg !587
  %503 = zext i8 %502 to i32, !dbg !731
  %504 = load i32, i32* %431, align 4, !dbg !732, !tbaa !363
  %505 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %503, i32 noundef %504) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %506, !dbg !735

506:                                              ; preds = %501, %433, %427
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %507 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %507, i8 0, i64 16, i1 false), !dbg !737
  %508 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 4, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 4, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 5, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 5, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %509 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %510 = bitcast i8* %509 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %510, metadata !423, metadata !DIExpression()), !dbg !587
  %511 = icmp eq i8* %509, null, !dbg !590
  br i1 %511, label %585, label %512, !dbg !591

512:                                              ; preds = %506
  %513 = getelementptr inbounds i8, i8* %509, i64 4, !dbg !592
  %514 = bitcast i8* %513 to i32*, !dbg !592
  %515 = load i32, i32* %514, align 4, !dbg !592, !tbaa !363
  %516 = load i32, i32* %510, align 4, !dbg !593, !tbaa !363
  %517 = getelementptr inbounds i8, i8* %509, i64 8, !dbg !594
  %518 = bitcast i8* %517 to i32*, !dbg !594
  %519 = load i32, i32* %518, align 4, !dbg !594, !tbaa !363
  %520 = getelementptr inbounds i8, i8* %509, i64 12, !dbg !595
  %521 = bitcast i8* %520 to i32*, !dbg !595
  %522 = load i32, i32* %521, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %515, metadata !605, metadata !DIExpression()), !dbg !612
  %523 = shl i32 %515, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %523, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %523, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %523, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %516, metadata !605, metadata !DIExpression()), !dbg !615
  %524 = shl i32 %516, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %524, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %524, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %524, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %519, metadata !605, metadata !DIExpression()), !dbg !618
  %525 = shl i32 %519, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %525, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %525, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %525, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %522, metadata !605, metadata !DIExpression()), !dbg !621
  %526 = shl i32 %522, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %526, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %526, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %526, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %523, metadata !684, metadata !DIExpression()), !dbg !686
  %527 = sext i32 %523 to i64, !dbg !690
  %528 = mul nsw i64 %527, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %528, metadata !685, metadata !DIExpression()), !dbg !686
  %529 = lshr exact i64 %528, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %528, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %530 = trunc i64 %529 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %530, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %524, metadata !684, metadata !DIExpression()), !dbg !686
  %531 = sext i32 %524 to i64, !dbg !690
  %532 = mul nsw i64 %531, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %532, metadata !685, metadata !DIExpression()), !dbg !686
  %533 = lshr exact i64 %532, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %532, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %534 = trunc i64 %533 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %525, metadata !684, metadata !DIExpression()), !dbg !686
  %535 = sext i32 %525 to i64, !dbg !690
  %536 = mul nsw i64 %535, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %536, metadata !685, metadata !DIExpression()), !dbg !686
  %537 = lshr exact i64 %536, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %536, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %538 = trunc i64 %537 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %526, metadata !684, metadata !DIExpression()), !dbg !686
  %539 = sext i32 %526 to i64, !dbg !690
  %540 = mul nsw i64 %539, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %540, metadata !685, metadata !DIExpression()), !dbg !686
  %541 = lshr exact i64 %540, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %540, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %542 = trunc i64 %541 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %543 = add i32 %530, 43371, !dbg !694
  %544 = add i32 %543, %534, !dbg !694
  %545 = add i32 %544, %538, !dbg !694
  %546 = add i32 %545, %542, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %523, metadata !684, metadata !DIExpression()), !dbg !686
  %547 = mul nsw i64 %527, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %547, metadata !685, metadata !DIExpression()), !dbg !686
  %548 = lshr exact i64 %547, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %547, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %549 = trunc i64 %548 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %549, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %524, metadata !684, metadata !DIExpression()), !dbg !686
  %550 = mul nsw i64 %531, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %550, metadata !685, metadata !DIExpression()), !dbg !686
  %551 = lshr exact i64 %550, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %550, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %552 = trunc i64 %551 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %525, metadata !684, metadata !DIExpression()), !dbg !686
  %553 = mul nsw i64 %535, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %553, metadata !685, metadata !DIExpression()), !dbg !686
  %554 = lshr exact i64 %553, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %553, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %555 = trunc i64 %554 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %526, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %556 = add i32 %549, -10468, !dbg !694
  %557 = add i32 %556, %552, !dbg !694
  %558 = add i32 %557, %555, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %559 = icmp sgt i32 %546, 0
  %560 = select i1 %559, i32 %546, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %561 = icmp sgt i32 %558, 0
  %562 = select i1 %561, i32 %558, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %560, metadata !684, metadata !DIExpression()), !dbg !704
  %563 = zext i32 %560 to i64, !dbg !706
  %564 = mul nuw nsw i64 %563, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %564, metadata !685, metadata !DIExpression()), !dbg !704
  %565 = lshr i64 %564, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %564, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %566 = trunc i64 %565 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %566, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %562, metadata !684, metadata !DIExpression()), !dbg !704
  %567 = zext i32 %562 to i64, !dbg !706
  %568 = mul nsw i64 %567, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %568, metadata !685, metadata !DIExpression()), !dbg !704
  %569 = lshr i64 %568, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %568, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %570 = trunc i64 %569 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %571 = add i32 %566, 9674, !dbg !710
  %572 = add i32 %571, %570, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %573 = icmp sgt i32 %572, 0
  %574 = select i1 %573, i32 %572, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %574, metadata !684, metadata !DIExpression()), !dbg !719
  %575 = zext i32 %574 to i64, !dbg !721
  %576 = mul nsw i64 %575, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %576, metadata !685, metadata !DIExpression()), !dbg !719
  %577 = lshr i64 %576, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %576, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %578 = trunc i64 %577 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %578, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %578, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %578, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %579 = icmp sgt i32 %578, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %579, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %579, label %580, label %585, !dbg !728

580:                                              ; preds = %512
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %581 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %581, metadata !420, metadata !DIExpression()), !dbg !587
  %582 = zext i8 %581 to i32, !dbg !731
  %583 = load i32, i32* %510, align 4, !dbg !732, !tbaa !363
  %584 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %582, i32 noundef %583) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %585, !dbg !735

585:                                              ; preds = %580, %512, %506
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %586 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %586, i8 0, i64 16, i1 false), !dbg !737
  %587 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 5, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 5, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 10, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 10, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %588 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %589 = bitcast i8* %588 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %589, metadata !423, metadata !DIExpression()), !dbg !587
  %590 = icmp eq i8* %588, null, !dbg !590
  br i1 %590, label %664, label %591, !dbg !591

591:                                              ; preds = %585
  %592 = getelementptr inbounds i8, i8* %588, i64 4, !dbg !592
  %593 = bitcast i8* %592 to i32*, !dbg !592
  %594 = load i32, i32* %593, align 4, !dbg !592, !tbaa !363
  %595 = load i32, i32* %589, align 4, !dbg !593, !tbaa !363
  %596 = getelementptr inbounds i8, i8* %588, i64 8, !dbg !594
  %597 = bitcast i8* %596 to i32*, !dbg !594
  %598 = load i32, i32* %597, align 4, !dbg !594, !tbaa !363
  %599 = getelementptr inbounds i8, i8* %588, i64 12, !dbg !595
  %600 = bitcast i8* %599 to i32*, !dbg !595
  %601 = load i32, i32* %600, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %594, metadata !605, metadata !DIExpression()), !dbg !612
  %602 = shl i32 %594, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %602, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %602, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %602, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %595, metadata !605, metadata !DIExpression()), !dbg !615
  %603 = shl i32 %595, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %603, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %603, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %603, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %598, metadata !605, metadata !DIExpression()), !dbg !618
  %604 = shl i32 %598, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %604, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %604, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %604, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %601, metadata !605, metadata !DIExpression()), !dbg !621
  %605 = shl i32 %601, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %605, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %605, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %605, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %602, metadata !684, metadata !DIExpression()), !dbg !686
  %606 = sext i32 %602 to i64, !dbg !690
  %607 = mul nsw i64 %606, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %607, metadata !685, metadata !DIExpression()), !dbg !686
  %608 = lshr exact i64 %607, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %607, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %609 = trunc i64 %608 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %609, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %603, metadata !684, metadata !DIExpression()), !dbg !686
  %610 = sext i32 %603 to i64, !dbg !690
  %611 = mul nsw i64 %610, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %611, metadata !685, metadata !DIExpression()), !dbg !686
  %612 = lshr exact i64 %611, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %611, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %613 = trunc i64 %612 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %604, metadata !684, metadata !DIExpression()), !dbg !686
  %614 = sext i32 %604 to i64, !dbg !690
  %615 = mul nsw i64 %614, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %615, metadata !685, metadata !DIExpression()), !dbg !686
  %616 = lshr exact i64 %615, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %615, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %617 = trunc i64 %616 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %605, metadata !684, metadata !DIExpression()), !dbg !686
  %618 = sext i32 %605 to i64, !dbg !690
  %619 = mul nsw i64 %618, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %619, metadata !685, metadata !DIExpression()), !dbg !686
  %620 = lshr exact i64 %619, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %619, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %621 = trunc i64 %620 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %622 = add i32 %609, 43371, !dbg !694
  %623 = add i32 %622, %613, !dbg !694
  %624 = add i32 %623, %617, !dbg !694
  %625 = add i32 %624, %621, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %602, metadata !684, metadata !DIExpression()), !dbg !686
  %626 = mul nsw i64 %606, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %626, metadata !685, metadata !DIExpression()), !dbg !686
  %627 = lshr exact i64 %626, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %626, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %628 = trunc i64 %627 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %628, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %603, metadata !684, metadata !DIExpression()), !dbg !686
  %629 = mul nsw i64 %610, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %629, metadata !685, metadata !DIExpression()), !dbg !686
  %630 = lshr exact i64 %629, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %629, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %631 = trunc i64 %630 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %604, metadata !684, metadata !DIExpression()), !dbg !686
  %632 = mul nsw i64 %614, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %632, metadata !685, metadata !DIExpression()), !dbg !686
  %633 = lshr exact i64 %632, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %632, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %634 = trunc i64 %633 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %605, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %635 = add i32 %628, -10468, !dbg !694
  %636 = add i32 %635, %631, !dbg !694
  %637 = add i32 %636, %634, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %638 = icmp sgt i32 %625, 0
  %639 = select i1 %638, i32 %625, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %640 = icmp sgt i32 %637, 0
  %641 = select i1 %640, i32 %637, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %639, metadata !684, metadata !DIExpression()), !dbg !704
  %642 = zext i32 %639 to i64, !dbg !706
  %643 = mul nuw nsw i64 %642, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %643, metadata !685, metadata !DIExpression()), !dbg !704
  %644 = lshr i64 %643, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %643, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %645 = trunc i64 %644 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %645, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %641, metadata !684, metadata !DIExpression()), !dbg !704
  %646 = zext i32 %641 to i64, !dbg !706
  %647 = mul nsw i64 %646, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %647, metadata !685, metadata !DIExpression()), !dbg !704
  %648 = lshr i64 %647, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %647, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %649 = trunc i64 %648 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %650 = add i32 %645, 9674, !dbg !710
  %651 = add i32 %650, %649, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %652 = icmp sgt i32 %651, 0
  %653 = select i1 %652, i32 %651, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %653, metadata !684, metadata !DIExpression()), !dbg !719
  %654 = zext i32 %653 to i64, !dbg !721
  %655 = mul nsw i64 %654, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %655, metadata !685, metadata !DIExpression()), !dbg !719
  %656 = lshr i64 %655, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %655, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %657 = trunc i64 %656 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %657, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %657, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %657, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %658 = icmp sgt i32 %657, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %658, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %658, label %659, label %664, !dbg !728

659:                                              ; preds = %591
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %660 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %660, metadata !420, metadata !DIExpression()), !dbg !587
  %661 = zext i8 %660 to i32, !dbg !731
  %662 = load i32, i32* %589, align 4, !dbg !732, !tbaa !363
  %663 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %661, i32 noundef %662) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %664, !dbg !735

664:                                              ; preds = %659, %591, %585
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %665 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %665, i8 0, i64 16, i1 false), !dbg !737
  %666 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 6, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 6, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 1, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 1, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %667 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %668 = bitcast i8* %667 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %668, metadata !423, metadata !DIExpression()), !dbg !587
  %669 = icmp eq i8* %667, null, !dbg !590
  br i1 %669, label %743, label %670, !dbg !591

670:                                              ; preds = %664
  %671 = getelementptr inbounds i8, i8* %667, i64 4, !dbg !592
  %672 = bitcast i8* %671 to i32*, !dbg !592
  %673 = load i32, i32* %672, align 4, !dbg !592, !tbaa !363
  %674 = load i32, i32* %668, align 4, !dbg !593, !tbaa !363
  %675 = getelementptr inbounds i8, i8* %667, i64 8, !dbg !594
  %676 = bitcast i8* %675 to i32*, !dbg !594
  %677 = load i32, i32* %676, align 4, !dbg !594, !tbaa !363
  %678 = getelementptr inbounds i8, i8* %667, i64 12, !dbg !595
  %679 = bitcast i8* %678 to i32*, !dbg !595
  %680 = load i32, i32* %679, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %673, metadata !605, metadata !DIExpression()), !dbg !612
  %681 = shl i32 %673, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %681, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %681, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %681, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %674, metadata !605, metadata !DIExpression()), !dbg !615
  %682 = shl i32 %674, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %682, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %682, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %682, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %677, metadata !605, metadata !DIExpression()), !dbg !618
  %683 = shl i32 %677, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %683, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %683, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %683, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %680, metadata !605, metadata !DIExpression()), !dbg !621
  %684 = shl i32 %680, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %684, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %684, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %684, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %681, metadata !684, metadata !DIExpression()), !dbg !686
  %685 = sext i32 %681 to i64, !dbg !690
  %686 = mul nsw i64 %685, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %686, metadata !685, metadata !DIExpression()), !dbg !686
  %687 = lshr exact i64 %686, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %686, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %688 = trunc i64 %687 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %688, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %682, metadata !684, metadata !DIExpression()), !dbg !686
  %689 = sext i32 %682 to i64, !dbg !690
  %690 = mul nsw i64 %689, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %690, metadata !685, metadata !DIExpression()), !dbg !686
  %691 = lshr exact i64 %690, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %690, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %692 = trunc i64 %691 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %683, metadata !684, metadata !DIExpression()), !dbg !686
  %693 = sext i32 %683 to i64, !dbg !690
  %694 = mul nsw i64 %693, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %694, metadata !685, metadata !DIExpression()), !dbg !686
  %695 = lshr exact i64 %694, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %694, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %696 = trunc i64 %695 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %684, metadata !684, metadata !DIExpression()), !dbg !686
  %697 = sext i32 %684 to i64, !dbg !690
  %698 = mul nsw i64 %697, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %698, metadata !685, metadata !DIExpression()), !dbg !686
  %699 = lshr exact i64 %698, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %698, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %700 = trunc i64 %699 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %701 = add i32 %688, 43371, !dbg !694
  %702 = add i32 %701, %692, !dbg !694
  %703 = add i32 %702, %696, !dbg !694
  %704 = add i32 %703, %700, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %681, metadata !684, metadata !DIExpression()), !dbg !686
  %705 = mul nsw i64 %685, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %705, metadata !685, metadata !DIExpression()), !dbg !686
  %706 = lshr exact i64 %705, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %705, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %707 = trunc i64 %706 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %707, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %682, metadata !684, metadata !DIExpression()), !dbg !686
  %708 = mul nsw i64 %689, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %708, metadata !685, metadata !DIExpression()), !dbg !686
  %709 = lshr exact i64 %708, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %708, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %710 = trunc i64 %709 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %683, metadata !684, metadata !DIExpression()), !dbg !686
  %711 = mul nsw i64 %693, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %711, metadata !685, metadata !DIExpression()), !dbg !686
  %712 = lshr exact i64 %711, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %711, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %713 = trunc i64 %712 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %684, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %714 = add i32 %707, -10468, !dbg !694
  %715 = add i32 %714, %710, !dbg !694
  %716 = add i32 %715, %713, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %717 = icmp sgt i32 %704, 0
  %718 = select i1 %717, i32 %704, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %719 = icmp sgt i32 %716, 0
  %720 = select i1 %719, i32 %716, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %718, metadata !684, metadata !DIExpression()), !dbg !704
  %721 = zext i32 %718 to i64, !dbg !706
  %722 = mul nuw nsw i64 %721, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %722, metadata !685, metadata !DIExpression()), !dbg !704
  %723 = lshr i64 %722, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %722, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %724 = trunc i64 %723 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %724, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %720, metadata !684, metadata !DIExpression()), !dbg !704
  %725 = zext i32 %720 to i64, !dbg !706
  %726 = mul nsw i64 %725, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %726, metadata !685, metadata !DIExpression()), !dbg !704
  %727 = lshr i64 %726, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %726, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %728 = trunc i64 %727 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %729 = add i32 %724, 9674, !dbg !710
  %730 = add i32 %729, %728, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %731 = icmp sgt i32 %730, 0
  %732 = select i1 %731, i32 %730, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %732, metadata !684, metadata !DIExpression()), !dbg !719
  %733 = zext i32 %732 to i64, !dbg !721
  %734 = mul nsw i64 %733, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %734, metadata !685, metadata !DIExpression()), !dbg !719
  %735 = lshr i64 %734, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %734, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %736 = trunc i64 %735 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %736, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %736, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %736, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %737 = icmp sgt i32 %736, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %737, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %737, label %738, label %743, !dbg !728

738:                                              ; preds = %670
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %739 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %739, metadata !420, metadata !DIExpression()), !dbg !587
  %740 = zext i8 %739 to i32, !dbg !731
  %741 = load i32, i32* %668, align 4, !dbg !732, !tbaa !363
  %742 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %740, i32 noundef %741) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %743, !dbg !735

743:                                              ; preds = %738, %670, %664
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %744 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %744, i8 0, i64 16, i1 false), !dbg !737
  %745 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 7, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 7, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 8, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 8, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %746 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %747 = bitcast i8* %746 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %747, metadata !423, metadata !DIExpression()), !dbg !587
  %748 = icmp eq i8* %746, null, !dbg !590
  br i1 %748, label %822, label %749, !dbg !591

749:                                              ; preds = %743
  %750 = getelementptr inbounds i8, i8* %746, i64 4, !dbg !592
  %751 = bitcast i8* %750 to i32*, !dbg !592
  %752 = load i32, i32* %751, align 4, !dbg !592, !tbaa !363
  %753 = load i32, i32* %747, align 4, !dbg !593, !tbaa !363
  %754 = getelementptr inbounds i8, i8* %746, i64 8, !dbg !594
  %755 = bitcast i8* %754 to i32*, !dbg !594
  %756 = load i32, i32* %755, align 4, !dbg !594, !tbaa !363
  %757 = getelementptr inbounds i8, i8* %746, i64 12, !dbg !595
  %758 = bitcast i8* %757 to i32*, !dbg !595
  %759 = load i32, i32* %758, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %752, metadata !605, metadata !DIExpression()), !dbg !612
  %760 = shl i32 %752, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %760, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %760, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %760, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %753, metadata !605, metadata !DIExpression()), !dbg !615
  %761 = shl i32 %753, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %761, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %761, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %761, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %756, metadata !605, metadata !DIExpression()), !dbg !618
  %762 = shl i32 %756, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %762, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %762, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %762, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %759, metadata !605, metadata !DIExpression()), !dbg !621
  %763 = shl i32 %759, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %763, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %763, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %763, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %760, metadata !684, metadata !DIExpression()), !dbg !686
  %764 = sext i32 %760 to i64, !dbg !690
  %765 = mul nsw i64 %764, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %765, metadata !685, metadata !DIExpression()), !dbg !686
  %766 = lshr exact i64 %765, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %765, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %767 = trunc i64 %766 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %767, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %761, metadata !684, metadata !DIExpression()), !dbg !686
  %768 = sext i32 %761 to i64, !dbg !690
  %769 = mul nsw i64 %768, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %769, metadata !685, metadata !DIExpression()), !dbg !686
  %770 = lshr exact i64 %769, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %769, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %771 = trunc i64 %770 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %762, metadata !684, metadata !DIExpression()), !dbg !686
  %772 = sext i32 %762 to i64, !dbg !690
  %773 = mul nsw i64 %772, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %773, metadata !685, metadata !DIExpression()), !dbg !686
  %774 = lshr exact i64 %773, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %773, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %775 = trunc i64 %774 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %763, metadata !684, metadata !DIExpression()), !dbg !686
  %776 = sext i32 %763 to i64, !dbg !690
  %777 = mul nsw i64 %776, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %777, metadata !685, metadata !DIExpression()), !dbg !686
  %778 = lshr exact i64 %777, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %777, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %779 = trunc i64 %778 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %780 = add i32 %767, 43371, !dbg !694
  %781 = add i32 %780, %771, !dbg !694
  %782 = add i32 %781, %775, !dbg !694
  %783 = add i32 %782, %779, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %760, metadata !684, metadata !DIExpression()), !dbg !686
  %784 = mul nsw i64 %764, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %784, metadata !685, metadata !DIExpression()), !dbg !686
  %785 = lshr exact i64 %784, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %784, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %786 = trunc i64 %785 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %786, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %761, metadata !684, metadata !DIExpression()), !dbg !686
  %787 = mul nsw i64 %768, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %787, metadata !685, metadata !DIExpression()), !dbg !686
  %788 = lshr exact i64 %787, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %787, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %789 = trunc i64 %788 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %762, metadata !684, metadata !DIExpression()), !dbg !686
  %790 = mul nsw i64 %772, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %790, metadata !685, metadata !DIExpression()), !dbg !686
  %791 = lshr exact i64 %790, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %790, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %792 = trunc i64 %791 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %763, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %793 = add i32 %786, -10468, !dbg !694
  %794 = add i32 %793, %789, !dbg !694
  %795 = add i32 %794, %792, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %796 = icmp sgt i32 %783, 0
  %797 = select i1 %796, i32 %783, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %798 = icmp sgt i32 %795, 0
  %799 = select i1 %798, i32 %795, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %797, metadata !684, metadata !DIExpression()), !dbg !704
  %800 = zext i32 %797 to i64, !dbg !706
  %801 = mul nuw nsw i64 %800, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %801, metadata !685, metadata !DIExpression()), !dbg !704
  %802 = lshr i64 %801, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %801, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %803 = trunc i64 %802 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %803, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %799, metadata !684, metadata !DIExpression()), !dbg !704
  %804 = zext i32 %799 to i64, !dbg !706
  %805 = mul nsw i64 %804, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %805, metadata !685, metadata !DIExpression()), !dbg !704
  %806 = lshr i64 %805, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %805, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %807 = trunc i64 %806 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %808 = add i32 %803, 9674, !dbg !710
  %809 = add i32 %808, %807, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %810 = icmp sgt i32 %809, 0
  %811 = select i1 %810, i32 %809, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %811, metadata !684, metadata !DIExpression()), !dbg !719
  %812 = zext i32 %811 to i64, !dbg !721
  %813 = mul nsw i64 %812, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %813, metadata !685, metadata !DIExpression()), !dbg !719
  %814 = lshr i64 %813, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %813, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %815 = trunc i64 %814 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %815, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %815, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %815, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %816 = icmp sgt i32 %815, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %816, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %816, label %817, label %822, !dbg !728

817:                                              ; preds = %749
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %818 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %818, metadata !420, metadata !DIExpression()), !dbg !587
  %819 = zext i8 %818 to i32, !dbg !731
  %820 = load i32, i32* %747, align 4, !dbg !732, !tbaa !363
  %821 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %819, i32 noundef %820) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %822, !dbg !735

822:                                              ; preds = %817, %749, %743
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %823 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %823, i8 0, i64 16, i1 false), !dbg !737
  %824 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 8, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 8, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 7, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 7, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %825 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %826 = bitcast i8* %825 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %826, metadata !423, metadata !DIExpression()), !dbg !587
  %827 = icmp eq i8* %825, null, !dbg !590
  br i1 %827, label %901, label %828, !dbg !591

828:                                              ; preds = %822
  %829 = getelementptr inbounds i8, i8* %825, i64 4, !dbg !592
  %830 = bitcast i8* %829 to i32*, !dbg !592
  %831 = load i32, i32* %830, align 4, !dbg !592, !tbaa !363
  %832 = load i32, i32* %826, align 4, !dbg !593, !tbaa !363
  %833 = getelementptr inbounds i8, i8* %825, i64 8, !dbg !594
  %834 = bitcast i8* %833 to i32*, !dbg !594
  %835 = load i32, i32* %834, align 4, !dbg !594, !tbaa !363
  %836 = getelementptr inbounds i8, i8* %825, i64 12, !dbg !595
  %837 = bitcast i8* %836 to i32*, !dbg !595
  %838 = load i32, i32* %837, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %831, metadata !605, metadata !DIExpression()), !dbg !612
  %839 = shl i32 %831, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %839, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %839, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %839, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %832, metadata !605, metadata !DIExpression()), !dbg !615
  %840 = shl i32 %832, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %840, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %840, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %840, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %835, metadata !605, metadata !DIExpression()), !dbg !618
  %841 = shl i32 %835, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %841, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %841, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %841, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %838, metadata !605, metadata !DIExpression()), !dbg !621
  %842 = shl i32 %838, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %842, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %842, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %842, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %839, metadata !684, metadata !DIExpression()), !dbg !686
  %843 = sext i32 %839 to i64, !dbg !690
  %844 = mul nsw i64 %843, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %844, metadata !685, metadata !DIExpression()), !dbg !686
  %845 = lshr exact i64 %844, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %844, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %846 = trunc i64 %845 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %846, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %840, metadata !684, metadata !DIExpression()), !dbg !686
  %847 = sext i32 %840 to i64, !dbg !690
  %848 = mul nsw i64 %847, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %848, metadata !685, metadata !DIExpression()), !dbg !686
  %849 = lshr exact i64 %848, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %848, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %850 = trunc i64 %849 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %841, metadata !684, metadata !DIExpression()), !dbg !686
  %851 = sext i32 %841 to i64, !dbg !690
  %852 = mul nsw i64 %851, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %852, metadata !685, metadata !DIExpression()), !dbg !686
  %853 = lshr exact i64 %852, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %852, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %854 = trunc i64 %853 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %842, metadata !684, metadata !DIExpression()), !dbg !686
  %855 = sext i32 %842 to i64, !dbg !690
  %856 = mul nsw i64 %855, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %856, metadata !685, metadata !DIExpression()), !dbg !686
  %857 = lshr exact i64 %856, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %856, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %858 = trunc i64 %857 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %859 = add i32 %846, 43371, !dbg !694
  %860 = add i32 %859, %850, !dbg !694
  %861 = add i32 %860, %854, !dbg !694
  %862 = add i32 %861, %858, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %839, metadata !684, metadata !DIExpression()), !dbg !686
  %863 = mul nsw i64 %843, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %863, metadata !685, metadata !DIExpression()), !dbg !686
  %864 = lshr exact i64 %863, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %863, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %865 = trunc i64 %864 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %865, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %840, metadata !684, metadata !DIExpression()), !dbg !686
  %866 = mul nsw i64 %847, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %866, metadata !685, metadata !DIExpression()), !dbg !686
  %867 = lshr exact i64 %866, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %866, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %868 = trunc i64 %867 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %841, metadata !684, metadata !DIExpression()), !dbg !686
  %869 = mul nsw i64 %851, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %869, metadata !685, metadata !DIExpression()), !dbg !686
  %870 = lshr exact i64 %869, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %869, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %871 = trunc i64 %870 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %842, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %872 = add i32 %865, -10468, !dbg !694
  %873 = add i32 %872, %868, !dbg !694
  %874 = add i32 %873, %871, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %875 = icmp sgt i32 %862, 0
  %876 = select i1 %875, i32 %862, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %877 = icmp sgt i32 %874, 0
  %878 = select i1 %877, i32 %874, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %876, metadata !684, metadata !DIExpression()), !dbg !704
  %879 = zext i32 %876 to i64, !dbg !706
  %880 = mul nuw nsw i64 %879, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %880, metadata !685, metadata !DIExpression()), !dbg !704
  %881 = lshr i64 %880, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %880, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %882 = trunc i64 %881 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %882, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %878, metadata !684, metadata !DIExpression()), !dbg !704
  %883 = zext i32 %878 to i64, !dbg !706
  %884 = mul nsw i64 %883, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %884, metadata !685, metadata !DIExpression()), !dbg !704
  %885 = lshr i64 %884, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %884, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %886 = trunc i64 %885 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %887 = add i32 %882, 9674, !dbg !710
  %888 = add i32 %887, %886, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %889 = icmp sgt i32 %888, 0
  %890 = select i1 %889, i32 %888, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %890, metadata !684, metadata !DIExpression()), !dbg !719
  %891 = zext i32 %890 to i64, !dbg !721
  %892 = mul nsw i64 %891, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %892, metadata !685, metadata !DIExpression()), !dbg !719
  %893 = lshr i64 %892, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %892, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %894 = trunc i64 %893 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %894, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %894, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %894, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %895 = icmp sgt i32 %894, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %895, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %895, label %896, label %901, !dbg !728

896:                                              ; preds = %828
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %897 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %897, metadata !420, metadata !DIExpression()), !dbg !587
  %898 = zext i8 %897 to i32, !dbg !731
  %899 = load i32, i32* %826, align 4, !dbg !732, !tbaa !363
  %900 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %898, i32 noundef %899) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %901, !dbg !735

901:                                              ; preds = %896, %828, %822
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %902 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %902, i8 0, i64 16, i1 false), !dbg !737
  %903 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 9, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 9, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 3, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 3, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %904 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %905 = bitcast i8* %904 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %905, metadata !423, metadata !DIExpression()), !dbg !587
  %906 = icmp eq i8* %904, null, !dbg !590
  br i1 %906, label %980, label %907, !dbg !591

907:                                              ; preds = %901
  %908 = getelementptr inbounds i8, i8* %904, i64 4, !dbg !592
  %909 = bitcast i8* %908 to i32*, !dbg !592
  %910 = load i32, i32* %909, align 4, !dbg !592, !tbaa !363
  %911 = load i32, i32* %905, align 4, !dbg !593, !tbaa !363
  %912 = getelementptr inbounds i8, i8* %904, i64 8, !dbg !594
  %913 = bitcast i8* %912 to i32*, !dbg !594
  %914 = load i32, i32* %913, align 4, !dbg !594, !tbaa !363
  %915 = getelementptr inbounds i8, i8* %904, i64 12, !dbg !595
  %916 = bitcast i8* %915 to i32*, !dbg !595
  %917 = load i32, i32* %916, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %910, metadata !605, metadata !DIExpression()), !dbg !612
  %918 = shl i32 %910, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %918, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %918, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %918, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %911, metadata !605, metadata !DIExpression()), !dbg !615
  %919 = shl i32 %911, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %919, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %919, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %919, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %914, metadata !605, metadata !DIExpression()), !dbg !618
  %920 = shl i32 %914, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %920, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %920, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %920, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %917, metadata !605, metadata !DIExpression()), !dbg !621
  %921 = shl i32 %917, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %921, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %921, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %921, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %918, metadata !684, metadata !DIExpression()), !dbg !686
  %922 = sext i32 %918 to i64, !dbg !690
  %923 = mul nsw i64 %922, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %923, metadata !685, metadata !DIExpression()), !dbg !686
  %924 = lshr exact i64 %923, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %923, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %925 = trunc i64 %924 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %925, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %919, metadata !684, metadata !DIExpression()), !dbg !686
  %926 = sext i32 %919 to i64, !dbg !690
  %927 = mul nsw i64 %926, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %927, metadata !685, metadata !DIExpression()), !dbg !686
  %928 = lshr exact i64 %927, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %927, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %929 = trunc i64 %928 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %920, metadata !684, metadata !DIExpression()), !dbg !686
  %930 = sext i32 %920 to i64, !dbg !690
  %931 = mul nsw i64 %930, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %931, metadata !685, metadata !DIExpression()), !dbg !686
  %932 = lshr exact i64 %931, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %931, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %933 = trunc i64 %932 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %921, metadata !684, metadata !DIExpression()), !dbg !686
  %934 = sext i32 %921 to i64, !dbg !690
  %935 = mul nsw i64 %934, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %935, metadata !685, metadata !DIExpression()), !dbg !686
  %936 = lshr exact i64 %935, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %935, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %937 = trunc i64 %936 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %938 = add i32 %925, 43371, !dbg !694
  %939 = add i32 %938, %929, !dbg !694
  %940 = add i32 %939, %933, !dbg !694
  %941 = add i32 %940, %937, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %918, metadata !684, metadata !DIExpression()), !dbg !686
  %942 = mul nsw i64 %922, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %942, metadata !685, metadata !DIExpression()), !dbg !686
  %943 = lshr exact i64 %942, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %942, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %944 = trunc i64 %943 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %944, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %919, metadata !684, metadata !DIExpression()), !dbg !686
  %945 = mul nsw i64 %926, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %945, metadata !685, metadata !DIExpression()), !dbg !686
  %946 = lshr exact i64 %945, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %945, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %947 = trunc i64 %946 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %920, metadata !684, metadata !DIExpression()), !dbg !686
  %948 = mul nsw i64 %930, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %948, metadata !685, metadata !DIExpression()), !dbg !686
  %949 = lshr exact i64 %948, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %948, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %950 = trunc i64 %949 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %921, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %951 = add i32 %944, -10468, !dbg !694
  %952 = add i32 %951, %947, !dbg !694
  %953 = add i32 %952, %950, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %954 = icmp sgt i32 %941, 0
  %955 = select i1 %954, i32 %941, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %956 = icmp sgt i32 %953, 0
  %957 = select i1 %956, i32 %953, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %955, metadata !684, metadata !DIExpression()), !dbg !704
  %958 = zext i32 %955 to i64, !dbg !706
  %959 = mul nuw nsw i64 %958, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %959, metadata !685, metadata !DIExpression()), !dbg !704
  %960 = lshr i64 %959, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %959, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %961 = trunc i64 %960 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %961, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %957, metadata !684, metadata !DIExpression()), !dbg !704
  %962 = zext i32 %957 to i64, !dbg !706
  %963 = mul nsw i64 %962, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %963, metadata !685, metadata !DIExpression()), !dbg !704
  %964 = lshr i64 %963, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %963, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %965 = trunc i64 %964 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %966 = add i32 %961, 9674, !dbg !710
  %967 = add i32 %966, %965, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %968 = icmp sgt i32 %967, 0
  %969 = select i1 %968, i32 %967, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %969, metadata !684, metadata !DIExpression()), !dbg !719
  %970 = zext i32 %969 to i64, !dbg !721
  %971 = mul nsw i64 %970, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %971, metadata !685, metadata !DIExpression()), !dbg !719
  %972 = lshr i64 %971, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %971, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %973 = trunc i64 %972 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %973, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %973, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %973, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %974 = icmp sgt i32 %973, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %974, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %974, label %975, label %980, !dbg !728

975:                                              ; preds = %907
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %976 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %976, metadata !420, metadata !DIExpression()), !dbg !587
  %977 = zext i8 %976 to i32, !dbg !731
  %978 = load i32, i32* %905, align 4, !dbg !732, !tbaa !363
  %979 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %977, i32 noundef %978) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %980, !dbg !735

980:                                              ; preds = %975, %907, %901
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %981 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %981, i8 0, i64 16, i1 false), !dbg !737
  %982 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 10, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 10, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 11, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 11, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %983 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %984 = bitcast i8* %983 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %984, metadata !423, metadata !DIExpression()), !dbg !587
  %985 = icmp eq i8* %983, null, !dbg !590
  br i1 %985, label %1059, label %986, !dbg !591

986:                                              ; preds = %980
  %987 = getelementptr inbounds i8, i8* %983, i64 4, !dbg !592
  %988 = bitcast i8* %987 to i32*, !dbg !592
  %989 = load i32, i32* %988, align 4, !dbg !592, !tbaa !363
  %990 = load i32, i32* %984, align 4, !dbg !593, !tbaa !363
  %991 = getelementptr inbounds i8, i8* %983, i64 8, !dbg !594
  %992 = bitcast i8* %991 to i32*, !dbg !594
  %993 = load i32, i32* %992, align 4, !dbg !594, !tbaa !363
  %994 = getelementptr inbounds i8, i8* %983, i64 12, !dbg !595
  %995 = bitcast i8* %994 to i32*, !dbg !595
  %996 = load i32, i32* %995, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %989, metadata !605, metadata !DIExpression()), !dbg !612
  %997 = shl i32 %989, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %997, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %997, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %997, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %990, metadata !605, metadata !DIExpression()), !dbg !615
  %998 = shl i32 %990, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %998, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %998, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %998, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %993, metadata !605, metadata !DIExpression()), !dbg !618
  %999 = shl i32 %993, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %999, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %999, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %999, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %996, metadata !605, metadata !DIExpression()), !dbg !621
  %1000 = shl i32 %996, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %1000, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %1000, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %1000, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %997, metadata !684, metadata !DIExpression()), !dbg !686
  %1001 = sext i32 %997 to i64, !dbg !690
  %1002 = mul nsw i64 %1001, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1002, metadata !685, metadata !DIExpression()), !dbg !686
  %1003 = lshr exact i64 %1002, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1002, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1004 = trunc i64 %1003 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %1004, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %998, metadata !684, metadata !DIExpression()), !dbg !686
  %1005 = sext i32 %998 to i64, !dbg !690
  %1006 = mul nsw i64 %1005, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1006, metadata !685, metadata !DIExpression()), !dbg !686
  %1007 = lshr exact i64 %1006, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1006, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1008 = trunc i64 %1007 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %999, metadata !684, metadata !DIExpression()), !dbg !686
  %1009 = sext i32 %999 to i64, !dbg !690
  %1010 = mul nsw i64 %1009, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1010, metadata !685, metadata !DIExpression()), !dbg !686
  %1011 = lshr exact i64 %1010, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1010, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1012 = trunc i64 %1011 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1000, metadata !684, metadata !DIExpression()), !dbg !686
  %1013 = sext i32 %1000 to i64, !dbg !690
  %1014 = mul nsw i64 %1013, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1014, metadata !685, metadata !DIExpression()), !dbg !686
  %1015 = lshr exact i64 %1014, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1014, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1016 = trunc i64 %1015 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %1017 = add i32 %1004, 43371, !dbg !694
  %1018 = add i32 %1017, %1008, !dbg !694
  %1019 = add i32 %1018, %1012, !dbg !694
  %1020 = add i32 %1019, %1016, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %997, metadata !684, metadata !DIExpression()), !dbg !686
  %1021 = mul nsw i64 %1001, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1021, metadata !685, metadata !DIExpression()), !dbg !686
  %1022 = lshr exact i64 %1021, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1021, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1023 = trunc i64 %1022 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %1023, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %998, metadata !684, metadata !DIExpression()), !dbg !686
  %1024 = mul nsw i64 %1005, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1024, metadata !685, metadata !DIExpression()), !dbg !686
  %1025 = lshr exact i64 %1024, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1024, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1026 = trunc i64 %1025 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %999, metadata !684, metadata !DIExpression()), !dbg !686
  %1027 = mul nsw i64 %1009, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1027, metadata !685, metadata !DIExpression()), !dbg !686
  %1028 = lshr exact i64 %1027, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1027, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1029 = trunc i64 %1028 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1000, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %1030 = add i32 %1023, -10468, !dbg !694
  %1031 = add i32 %1030, %1026, !dbg !694
  %1032 = add i32 %1031, %1029, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %1033 = icmp sgt i32 %1020, 0
  %1034 = select i1 %1033, i32 %1020, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %1035 = icmp sgt i32 %1032, 0
  %1036 = select i1 %1035, i32 %1032, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %1034, metadata !684, metadata !DIExpression()), !dbg !704
  %1037 = zext i32 %1034 to i64, !dbg !706
  %1038 = mul nuw nsw i64 %1037, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %1038, metadata !685, metadata !DIExpression()), !dbg !704
  %1039 = lshr i64 %1038, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %1038, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %1040 = trunc i64 %1039 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %1040, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %1036, metadata !684, metadata !DIExpression()), !dbg !704
  %1041 = zext i32 %1036 to i64, !dbg !706
  %1042 = mul nsw i64 %1041, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %1042, metadata !685, metadata !DIExpression()), !dbg !704
  %1043 = lshr i64 %1042, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %1042, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %1044 = trunc i64 %1043 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %1045 = add i32 %1040, 9674, !dbg !710
  %1046 = add i32 %1045, %1044, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %1047 = icmp sgt i32 %1046, 0
  %1048 = select i1 %1047, i32 %1046, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %1048, metadata !684, metadata !DIExpression()), !dbg !719
  %1049 = zext i32 %1048 to i64, !dbg !721
  %1050 = mul nsw i64 %1049, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %1050, metadata !685, metadata !DIExpression()), !dbg !719
  %1051 = lshr i64 %1050, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %1050, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %1052 = trunc i64 %1051 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %1052, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %1052, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %1052, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %1053 = icmp sgt i32 %1052, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %1053, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %1053, label %1054, label %1059, !dbg !728

1054:                                             ; preds = %986
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %1055 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %1055, metadata !420, metadata !DIExpression()), !dbg !587
  %1056 = zext i8 %1055 to i32, !dbg !731
  %1057 = load i32, i32* %984, align 4, !dbg !732, !tbaa !363
  %1058 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %1056, i32 noundef %1057) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %1059, !dbg !735

1059:                                             ; preds = %1054, %986, %980
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %1060 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1060, i8 0, i64 16, i1 false), !dbg !737
  %1061 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 11, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.value(metadata i64 11, metadata !418, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %8) #7, !dbg !586
  call void @llvm.dbg.value(metadata i8 4, metadata !420, metadata !DIExpression()), !dbg !587
  store i8 4, i8* %8, align 1, !dbg !588, !tbaa !315
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %1062 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8) #7, !dbg !589
  %1063 = bitcast i8* %1062 to i32*, !dbg !589
  call void @llvm.dbg.value(metadata i32* %1063, metadata !423, metadata !DIExpression()), !dbg !587
  %1064 = icmp eq i8* %1062, null, !dbg !590
  br i1 %1064, label %1138, label %1065, !dbg !591

1065:                                             ; preds = %1059
  %1066 = getelementptr inbounds i8, i8* %1062, i64 4, !dbg !592
  %1067 = bitcast i8* %1066 to i32*, !dbg !592
  %1068 = load i32, i32* %1067, align 4, !dbg !592, !tbaa !363
  %1069 = load i32, i32* %1063, align 4, !dbg !593, !tbaa !363
  %1070 = getelementptr inbounds i8, i8* %1062, i64 8, !dbg !594
  %1071 = bitcast i8* %1070 to i32*, !dbg !594
  %1072 = load i32, i32* %1071, align 4, !dbg !594, !tbaa !363
  %1073 = getelementptr inbounds i8, i8* %1062, i64 12, !dbg !595
  %1074 = bitcast i8* %1073 to i32*, !dbg !595
  %1075 = load i32, i32* %1074, align 4, !dbg !595, !tbaa !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !424, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.value(metadata i32* undef, metadata !597, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 %1068, metadata !605, metadata !DIExpression()), !dbg !612
  %1076 = shl i32 %1068, 15, !dbg !614
  call void @llvm.dbg.value(metadata i32 %1076, metadata !610, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %1076, metadata !611, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.value(metadata i32 %1076, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %1069, metadata !605, metadata !DIExpression()), !dbg !615
  %1077 = shl i32 %1069, 15, !dbg !617
  call void @llvm.dbg.value(metadata i32 %1077, metadata !610, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %1077, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 %1077, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %1072, metadata !605, metadata !DIExpression()), !dbg !618
  %1078 = shl i32 %1072, 15, !dbg !620
  call void @llvm.dbg.value(metadata i32 %1078, metadata !610, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %1078, metadata !611, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata i32 %1078, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32 %1075, metadata !605, metadata !DIExpression()), !dbg !621
  %1079 = shl i32 %1075, 15, !dbg !623
  call void @llvm.dbg.value(metadata i32 %1079, metadata !610, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %1079, metadata !611, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 %1079, metadata !602, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)), !dbg !603
  call void @llvm.dbg.value(metadata i32* undef, metadata !624, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i32* undef, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32* undef, metadata !657, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !659, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 51203, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1076, metadata !684, metadata !DIExpression()), !dbg !686
  %1080 = sext i32 %1076 to i64, !dbg !690
  %1081 = mul nsw i64 %1080, 51203, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1081, metadata !685, metadata !DIExpression()), !dbg !686
  %1082 = lshr exact i64 %1081, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1081, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1083 = trunc i64 %1082 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %1083, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 2, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -21013, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1077, metadata !684, metadata !DIExpression()), !dbg !686
  %1084 = sext i32 %1077 to i64, !dbg !690
  %1085 = mul nsw i64 %1084, -21013, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1085, metadata !685, metadata !DIExpression()), !dbg !686
  %1086 = lshr exact i64 %1085, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1085, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1087 = trunc i64 %1086 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 4, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 7988, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1078, metadata !684, metadata !DIExpression()), !dbg !686
  %1088 = sext i32 %1078 to i64, !dbg !690
  %1089 = mul nsw i64 %1088, 7988, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1089, metadata !685, metadata !DIExpression()), !dbg !686
  %1090 = lshr exact i64 %1089, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1089, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1091 = trunc i64 %1090 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 6, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 12, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1079, metadata !684, metadata !DIExpression()), !dbg !686
  %1092 = sext i32 %1079 to i64, !dbg !690
  %1093 = mul nsw i64 %1092, 12, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1093, metadata !685, metadata !DIExpression()), !dbg !686
  %1094 = lshr exact i64 %1093, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1093, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1095 = trunc i64 %1094 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %1096 = add i32 %1083, 43371, !dbg !694
  %1097 = add i32 %1096, %1087, !dbg !694
  %1098 = add i32 %1097, %1091, !dbg !694
  %1099 = add i32 %1098, %1095, !dbg !695
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 3853, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1076, metadata !684, metadata !DIExpression()), !dbg !686
  %1100 = mul nsw i64 %1080, 3853, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1100, metadata !685, metadata !DIExpression()), !dbg !686
  %1101 = lshr exact i64 %1100, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1100, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1102 = trunc i64 %1101 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 %1102, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 3, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 16998, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1077, metadata !684, metadata !DIExpression()), !dbg !686
  %1103 = mul nsw i64 %1084, 16998, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1103, metadata !685, metadata !DIExpression()), !dbg !686
  %1104 = lshr exact i64 %1103, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1103, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1105 = trunc i64 %1104 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 5, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 -5358, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1078, metadata !684, metadata !DIExpression()), !dbg !686
  %1106 = mul nsw i64 %1088, -5358, !dbg !691
  call void @llvm.dbg.value(metadata i64 %1106, metadata !685, metadata !DIExpression()), !dbg !686
  %1107 = lshr exact i64 %1106, 15, !dbg !692
  call void @llvm.dbg.value(metadata i64 %1106, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  %1108 = trunc i64 %1107 to i32, !dbg !693
  call void @llvm.dbg.value(metadata i64 3, metadata !667, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 7, metadata !660, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !661, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata i32 0, metadata !679, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i32 %1079, metadata !684, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i64 0, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !686
  call void @llvm.dbg.value(metadata i64 4, metadata !667, metadata !DIExpression()), !dbg !677
  %1109 = add i32 %1102, -10468, !dbg !694
  %1110 = add i32 %1109, %1105, !dbg !694
  %1111 = add i32 %1110, %1108, !dbg !694
  call void @llvm.dbg.value(metadata i64 2, metadata !662, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !696
  %1112 = icmp sgt i32 %1099, 0
  %1113 = select i1 %1112, i32 %1099, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !696
  %1114 = icmp sgt i32 %1111, 0
  %1115 = select i1 %1114, i32 %1111, i32 0
  call void @llvm.dbg.value(metadata i64 2, metadata !669, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !644, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !698
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !659, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 59604, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %1113, metadata !684, metadata !DIExpression()), !dbg !704
  %1116 = zext i32 %1113 to i64, !dbg !706
  %1117 = mul nuw nsw i64 %1116, 59604, !dbg !707
  call void @llvm.dbg.value(metadata i64 %1117, metadata !685, metadata !DIExpression()), !dbg !704
  %1118 = lshr i64 %1117, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %1117, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %1119 = trunc i64 %1118 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata i32 %1119, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 1, metadata !660, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !661, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i32 -7957, metadata !679, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i32 %1115, metadata !684, metadata !DIExpression()), !dbg !704
  %1120 = zext i32 %1115 to i64, !dbg !706
  %1121 = mul nsw i64 %1120, -7957, !dbg !707
  call void @llvm.dbg.value(metadata i64 %1121, metadata !685, metadata !DIExpression()), !dbg !704
  %1122 = lshr i64 %1121, 15, !dbg !708
  call void @llvm.dbg.value(metadata i64 %1121, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !704
  %1123 = trunc i64 %1122 to i32, !dbg !709
  call void @llvm.dbg.value(metadata i32 undef, metadata !664, metadata !DIExpression()), !dbg !703
  call void @llvm.dbg.value(metadata i64 2, metadata !667, metadata !DIExpression()), !dbg !702
  %1124 = add i32 %1119, 9674, !dbg !710
  %1125 = add i32 %1124, %1123, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !669, metadata !DIExpression()), !dbg !712
  %1126 = icmp sgt i32 %1125, 0
  %1127 = select i1 %1126, i32 %1125, i32 0
  call void @llvm.dbg.value(metadata i64 1, metadata !669, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 1, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 2, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 3, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i64 4, metadata !647, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.value(metadata i32 undef, metadata !642, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata !651, metadata !652, metadata !DIExpression(DW_OP_plus_uconst, 64, DW_OP_stack_value)), !dbg !714
  call void @llvm.dbg.value(metadata i32 2, metadata !659, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i64 0, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i32 0, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !661, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata i32 -24584, metadata !679, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %1127, metadata !684, metadata !DIExpression()), !dbg !719
  %1128 = zext i32 %1127 to i64, !dbg !721
  %1129 = mul nsw i64 %1128, -24584, !dbg !722
  call void @llvm.dbg.value(metadata i64 %1129, metadata !685, metadata !DIExpression()), !dbg !719
  %1130 = lshr i64 %1129, 15, !dbg !723
  call void @llvm.dbg.value(metadata i64 %1129, metadata !685, metadata !DIExpression(DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !719
  %1131 = trunc i64 %1130 to i32, !dbg !724
  call void @llvm.dbg.value(metadata i32 %1131, metadata !664, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.value(metadata i64 1, metadata !667, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.value(metadata i64 1, metadata !662, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata i32 0, metadata !669, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 %1131, metadata !632, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_stack_value)), !dbg !634
  call void @llvm.dbg.value(metadata i32 %1131, metadata !633, metadata !DIExpression(DW_OP_plus_uconst, 54859, DW_OP_constu, 15, DW_OP_shra, DW_OP_stack_value)), !dbg !634
  %1132 = icmp sgt i32 %1131, -22092, !dbg !726
  call void @llvm.dbg.value(metadata i1 %1132, metadata !427, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !596
  br i1 %1132, label %1133, label %1138, !dbg !728

1133:                                             ; preds = %1065
  call void @llvm.lifetime.start.p0i8(i64 42, i8* nonnull %191) #7, !dbg !729
  call void @llvm.dbg.declare(metadata [42 x i8]* %9, metadata !428, metadata !DIExpression()), !dbg !730
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(42) %191, i8* noundef nonnull align 1 dereferenceable(42) getelementptr inbounds ([42 x i8], [42 x i8]* @__const.xdp_neural_network.buf, i64 0, i64 0), i64 42, i1 false), !dbg !730
  %1134 = load i8, i8* %8, align 1, !dbg !731, !tbaa !315
  call void @llvm.dbg.value(metadata i8 %1134, metadata !420, metadata !DIExpression()), !dbg !587
  %1135 = zext i8 %1134 to i32, !dbg !731
  %1136 = load i32, i32* %1063, align 4, !dbg !732, !tbaa !363
  %1137 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* noundef nonnull %191, i32 noundef 42, i32 noundef %1135, i32 noundef %1136) #7, !dbg !733
  call void @llvm.lifetime.end.p0i8(i64 42, i8* nonnull %191) #7, !dbg !734
  br label %1138, !dbg !735

1138:                                             ; preds = %1133, %1065, %1059
  call void @llvm.dbg.value(metadata [4 x i32]* %10, metadata !434, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i8* %8, metadata !420, metadata !DIExpression(DW_OP_deref)), !dbg !587
  %1139 = bitcast [4 x i32]* %10 to i8*, !dbg !736
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1139, i8 0, i64 16, i1 false), !dbg !737
  %1140 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @ip_map to i8*), i8* noundef nonnull %8, i8* noundef nonnull %192, i64 noundef 0) #7, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %8) #7, !dbg !738
  call void @llvm.dbg.value(metadata i64 12, metadata !418, metadata !DIExpression()), !dbg !585
  %1141 = bitcast i32* %11 to i8*, !dbg !739
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1141) #7, !dbg !739
  call void @llvm.dbg.value(metadata i32 2, metadata !435, metadata !DIExpression()), !dbg !584
  store i32 2, i32* %11, align 4, !dbg !740, !tbaa !363
  call void @llvm.dbg.value(metadata i32* %11, metadata !435, metadata !DIExpression(DW_OP_deref)), !dbg !584
  %1142 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %1141) #7, !dbg !741
  call void @llvm.dbg.value(metadata i8* %1142, metadata !436, metadata !DIExpression()), !dbg !584
  %1143 = call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !742
  call void @llvm.dbg.value(metadata i64 %1143, metadata !437, metadata !DIExpression()), !dbg !584
  %1144 = bitcast i64* %12 to i8*, !dbg !743
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1144) #7, !dbg !743
  %1145 = sub nsw i64 %1143, %190, !dbg !744
  call void @llvm.dbg.value(metadata i64 %1145, metadata !438, metadata !DIExpression()), !dbg !584
  store i64 %1145, i64* %12, align 8, !dbg !745, !tbaa !377
  %1146 = icmp eq i8* %1142, null, !dbg !746
  br i1 %1146, label %1151, label %1147, !dbg !748

1147:                                             ; preds = %1138
  %1148 = bitcast i8* %1142 to i64*, !dbg !741
  call void @llvm.dbg.value(metadata i64* %1148, metadata !436, metadata !DIExpression()), !dbg !584
  %1149 = load i64, i64* %1148, align 8, !dbg !749, !tbaa !377
  %1150 = add nsw i64 %1149, %1145, !dbg !751
  call void @llvm.dbg.value(metadata i64 %1150, metadata !438, metadata !DIExpression()), !dbg !584
  store i64 %1150, i64* %12, align 8, !dbg !751, !tbaa !377
  call void @llvm.dbg.value(metadata i32* %11, metadata !435, metadata !DIExpression(DW_OP_deref)), !dbg !584
  call void @llvm.dbg.value(metadata i64* %12, metadata !438, metadata !DIExpression(DW_OP_deref)), !dbg !584
  br label %1151

1151:                                             ; preds = %1138, %1147
  %1152 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @time_map to i8*), i8* noundef nonnull %1141, i8* noundef nonnull %1144, i64 noundef 0) #7, !dbg !752
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1144) #7, !dbg !753
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1141) #7, !dbg !753
  br label %1153, !dbg !754

1153:                                             ; preds = %180, %1151, %182
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %177) #7, !dbg !755
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %167) #7, !dbg !755
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %165) #7, !dbg !755
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %163) #7, !dbg !755
  br label %1154

1154:                                             ; preds = %151, %60, %122, %116, %107, %101, %95, %86, %80, %74, %68, %65, %62, %1, %56, %1153
  %1155 = phi i32 [ 2, %1153 ], [ 2, %56 ], [ 1, %1 ], [ 1, %151 ], [ 1, %60 ], [ 1, %122 ], [ 1, %116 ], [ 1, %107 ], [ 1, %101 ], [ 1, %95 ], [ 1, %86 ], [ 1, %80 ], [ 1, %74 ], [ 1, %68 ], [ 1, %65 ], [ 2, %62 ], !dbg !439
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #7, !dbg !756
  ret i32 %1155, !dbg !756
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!152, !153, !154, !155}
!llvm.ident = !{!156}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !151, line: 16, type: !40, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !20, globals: !37, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "98c32b43891571098ce389e93bb95a7c")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "db1ce4e5e29770657167bc8f57af9388")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_EmlNetActivationFunction", file: !15, line: 18, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "./neural_network_fix.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "418f86e14594393deccfb10a7f72237f")
!16 = !{!17, !18, !19}
!17 = !DIEnumerator(name: "EmlNetActivationIdentity", value: 0)
!18 = !DIEnumerator(name: "EmlNetActivationRelu", value: 1)
!19 = !DIEnumerator(name: "EmlNetActivationFunctions", value: 2)
!20 = !{!21, !22, !23, !26, !28, !29, !30, !35}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !24, line: 24, baseType: !25)
!24 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !31, line: 27, baseType: !32)
!31 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !33, line: 47, baseType: !34)
!33 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!34 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !31, line: 26, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !33, line: 41, baseType: !28)
!37 = !{!0, !38, !48, !50, !56, !64, !71, !76, !82, !88, !90, !114, !117, !122, !127, !129, !134, !136, !138, !141, !143}
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "ip_map", scope: !2, file: !3, line: 14, type: !40, isLocal: false, isDefinition: true)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !41, line: 33, size: 160, elements: !42)
!41 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "9e37b5f46a8fb7f5ed35ab69309bf15d")
!42 = !{!43, !44, !45, !46, !47}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !40, file: !41, line: 34, baseType: !7, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !40, file: !41, line: 35, baseType: !7, size: 32, offset: 32)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !40, file: !41, line: 36, baseType: !7, size: 32, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !40, file: !41, line: 37, baseType: !7, size: 32, offset: 96)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !40, file: !41, line: 38, baseType: !7, size: 32, offset: 128)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "time_map", scope: !2, file: !3, line: 22, type: !40, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 491, type: !52, isLocal: false, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 32, elements: !54)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !{!55}
!55 = !DISubrange(count: 4)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !58, line: 89, type: !59, isLocal: true, isDefinition: true)
!58 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "2601bcf9d7985cb46bfbd904b60f5aaf")
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!62}
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !24, line: 31, baseType: !63)
!63 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !58, line: 33, type: !66, isLocal: true, isDefinition: true)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DISubroutineType(types: !68)
!68 = !{!21, !21, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !58, line: 55, type: !73, isLocal: true, isDefinition: true)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DISubroutineType(types: !75)
!75 = !{!28, !21, !69, !69, !62}
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "ultByte", scope: !2, file: !3, line: 30, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 96, elements: !80)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!80 = !{!81}
!81 = !DISubrange(count: 12)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "outputs", scope: !2, file: !15, line: 13, type: !84, isLocal: true, isDefinition: true)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 96, elements: !86)
!85 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!86 = !{!87}
!87 = !DISubrange(count: 3)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "inputs", scope: !2, file: !15, line: 14, type: !84, isLocal: true, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "model", scope: !2, file: !15, line: 108, type: !92, isLocal: true, isDefinition: true)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "EmlNet", file: !15, line: 42, baseType: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EmlNet", file: !15, line: 34, size: 320, elements: !94)
!94 = !{!95, !96, !110, !112, !113}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "n_layers", scope: !93, file: !15, line: 36, baseType: !35, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "layers", scope: !93, file: !15, line: 37, baseType: !97, size: 64, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "EmlNetLayer", file: !15, line: 31, baseType: !100)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EmlNetLayer", file: !15, line: 25, size: 256, elements: !101)
!101 = !{!102, !103, !104, !107, !108}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "n_outputs", scope: !100, file: !15, line: 26, baseType: !35, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "n_inputs", scope: !100, file: !15, line: 27, baseType: !35, size: 32, offset: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "weights", scope: !100, file: !15, line: 28, baseType: !105, size: 64, offset: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "biases", scope: !100, file: !15, line: 29, baseType: !105, size: 64, offset: 128)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "activation", scope: !100, file: !15, line: 30, baseType: !109, size: 32, offset: 192)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "EmlNetActivationFunction", file: !15, line: 22, baseType: !14)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "activations1", scope: !93, file: !15, line: 39, baseType: !111, size: 64, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "activations2", scope: !93, file: !15, line: 40, baseType: !111, size: 64, offset: 192)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "activations_length", scope: !93, file: !15, line: 41, baseType: !35, size: 32, offset: 256)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "model_layers", scope: !2, file: !15, line: 104, type: !116, isLocal: true, isDefinition: true)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 768, elements: !86)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(name: "model_layer0_weights", scope: !2, file: !15, line: 97, type: !119, isLocal: true, isDefinition: true)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 256, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 8)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(name: "model_layer0_biases", scope: !2, file: !15, line: 98, type: !124, isLocal: true, isDefinition: true)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 2)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(name: "model_layer1_weights", scope: !2, file: !15, line: 99, type: !124, isLocal: true, isDefinition: true)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "model_layer1_biases", scope: !2, file: !15, line: 100, type: !131, isLocal: true, isDefinition: true)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 32, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 1)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(name: "model_layer2_weights", scope: !2, file: !15, line: 101, type: !131, isLocal: true, isDefinition: true)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(name: "model_layer2_biases", scope: !2, file: !15, line: 102, type: !131, isLocal: true, isDefinition: true)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(name: "model_buf1", scope: !2, file: !15, line: 44, type: !140, isLocal: true, isDefinition: true)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !54)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(name: "model_buf2", scope: !2, file: !15, line: 45, type: !140, isLocal: true, isDefinition: true)
!143 = !DIGlobalVariableExpression(var: !144, expr: !DIExpression())
!144 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !58, line: 152, type: !145, isLocal: true, isDefinition: true)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!146 = !DISubroutineType(types: !147)
!147 = !{!28, !148, !150, null}
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !53)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !24, line: 27, baseType: !7)
!151 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "0f65d57b07088eec24d5031993b90668")
!152 = !{i32 7, !"Dwarf Version", i32 5}
!153 = !{i32 2, !"Debug Info Version", i32 3}
!154 = !{i32 1, !"wchar_size", i32 4}
!155 = !{i32 7, !"frame-pointer", i32 2}
!156 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!157 = distinct !DISubprogram(name: "xdp_parser_func", scope: !3, file: !3, line: 33, type: !158, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!158 = !DISubroutineType(types: !159)
!159 = !{!28, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !162)
!162 = !{!163, !164, !165, !166, !167}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !161, file: !6, line: 2857, baseType: !150, size: 32)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !161, file: !6, line: 2858, baseType: !150, size: 32, offset: 32)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !161, file: !6, line: 2859, baseType: !150, size: 32, offset: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !161, file: !6, line: 2861, baseType: !150, size: 32, offset: 96)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !161, file: !6, line: 2862, baseType: !150, size: 32, offset: 128)
!168 = !{!169, !170, !171, !172, !173, !186, !191, !192, !195, !196, !197, !198, !199, !200, !203, !204, !206, !207}
!169 = !DILocalVariable(name: "ctx", arg: 1, scope: !157, file: !3, line: 33, type: !160)
!170 = !DILocalVariable(name: "start_time_parser", scope: !157, file: !3, line: 37, type: !34)
!171 = !DILocalVariable(name: "data_end", scope: !157, file: !3, line: 40, type: !21)
!172 = !DILocalVariable(name: "data", scope: !157, file: !3, line: 41, type: !21)
!173 = !DILocalVariable(name: "eth", scope: !157, file: !3, line: 42, type: !174)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !176, line: 168, size: 112, elements: !177)
!176 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!177 = !{!178, !182, !183}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !175, file: !176, line: 169, baseType: !179, size: 48)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 48, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 6)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !175, file: !176, line: 170, baseType: !179, size: 48, offset: 48)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !175, file: !176, line: 171, baseType: !184, size: 16, offset: 96)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !185, line: 25, baseType: !23)
!185 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!186 = !DILocalVariable(name: "nh", scope: !157, file: !3, line: 43, type: !187)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !188, line: 33, size: 64, elements: !189)
!188 = !DIFile(filename: "./parsing_helpers.h", directory: "/home/irene/Desktop/xdp/libbpf/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "347e5950d9164c54cb6bf50ac022e20c")
!189 = !{!190}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !187, file: !188, line: 34, baseType: !21, size: 64)
!191 = !DILocalVariable(name: "eth_type", scope: !157, file: !3, line: 44, type: !28)
!192 = !DILocalVariable(name: "size", scope: !193, file: !3, line: 58, type: !28)
!193 = distinct !DILexicalBlock(scope: !194, file: !3, line: 54, column: 38)
!194 = distinct !DILexicalBlock(scope: !157, file: !3, line: 54, column: 6)
!195 = !DILocalVariable(name: "ipv6", scope: !193, file: !3, line: 60, type: !26)
!196 = !DILocalVariable(name: "type", scope: !193, file: !3, line: 61, type: !26)
!197 = !DILocalVariable(name: "lastbyte", scope: !193, file: !3, line: 62, type: !26)
!198 = !DILocalVariable(name: "code", scope: !193, file: !3, line: 196, type: !28)
!199 = !DILocalVariable(name: "count", scope: !193, file: !3, line: 198, type: !29)
!200 = !DILocalVariable(name: "initial_count", scope: !201, file: !3, line: 202, type: !29)
!201 = distinct !DILexicalBlock(scope: !202, file: !3, line: 201, column: 21)
!202 = distinct !DILexicalBlock(scope: !193, file: !3, line: 201, column: 7)
!203 = !DILocalVariable(name: "time_parsing", scope: !193, file: !3, line: 216, type: !28)
!204 = !DILocalVariable(name: "total_parsing", scope: !193, file: !3, line: 217, type: !205)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!206 = !DILocalVariable(name: "end_time_parser", scope: !193, file: !3, line: 218, type: !34)
!207 = !DILocalVariable(name: "duration_parsing", scope: !193, file: !3, line: 219, type: !34)
!208 = !DILocation(line: 0, scope: !157)
!209 = !DILocation(line: 37, column: 36, scope: !157)
!210 = !DILocation(line: 40, column: 38, scope: !157)
!211 = !{!212, !213, i64 4}
!212 = !{!"xdp_md", !213, i64 0, !213, i64 4, !213, i64 8, !213, i64 12, !213, i64 16}
!213 = !{!"int", !214, i64 0}
!214 = !{!"omnipotent char", !215, i64 0}
!215 = !{!"Simple C/C++ TBAA"}
!216 = !DILocation(line: 40, column: 27, scope: !157)
!217 = !DILocation(line: 40, column: 19, scope: !157)
!218 = !DILocation(line: 41, column: 34, scope: !157)
!219 = !{!212, !213, i64 0}
!220 = !DILocation(line: 41, column: 23, scope: !157)
!221 = !DILocation(line: 41, column: 15, scope: !157)
!222 = !DILocalVariable(name: "nh", arg: 1, scope: !223, file: !188, line: 124, type: !226)
!223 = distinct !DISubprogram(name: "parse_ethhdr", scope: !188, file: !188, line: 124, type: !224, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !228)
!224 = !DISubroutineType(types: !225)
!225 = !{!28, !226, !21, !227}
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!228 = !{!222, !229, !230}
!229 = !DILocalVariable(name: "data_end", arg: 2, scope: !223, file: !188, line: 125, type: !21)
!230 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !223, file: !188, line: 126, type: !227)
!231 = !DILocation(line: 0, scope: !223, inlinedAt: !232)
!232 = distinct !DILocation(line: 49, column: 13, scope: !157)
!233 = !DILocalVariable(name: "nh", arg: 1, scope: !234, file: !188, line: 79, type: !226)
!234 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !188, file: !188, line: 79, type: !235, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!235 = !DISubroutineType(types: !236)
!236 = !{!28, !226, !21, !227, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !188, line: 64, size: 32, elements: !239)
!239 = !{!240}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !238, file: !188, line: 65, baseType: !241, size: 32)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 32, elements: !125)
!242 = !{!233, !243, !244, !245, !246, !247, !248, !254, !255}
!243 = !DILocalVariable(name: "data_end", arg: 2, scope: !234, file: !188, line: 80, type: !21)
!244 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !234, file: !188, line: 81, type: !227)
!245 = !DILocalVariable(name: "vlans", arg: 4, scope: !234, file: !188, line: 82, type: !237)
!246 = !DILocalVariable(name: "eth", scope: !234, file: !188, line: 84, type: !174)
!247 = !DILocalVariable(name: "hdrsize", scope: !234, file: !188, line: 85, type: !28)
!248 = !DILocalVariable(name: "vlh", scope: !234, file: !188, line: 86, type: !249)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64)
!250 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !188, line: 42, size: 32, elements: !251)
!251 = !{!252, !253}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !250, file: !188, line: 43, baseType: !184, size: 16)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !250, file: !188, line: 44, baseType: !184, size: 16, offset: 16)
!254 = !DILocalVariable(name: "h_proto", scope: !234, file: !188, line: 87, type: !23)
!255 = !DILocalVariable(name: "i", scope: !234, file: !188, line: 88, type: !28)
!256 = !DILocation(line: 0, scope: !234, inlinedAt: !257)
!257 = distinct !DILocation(line: 129, column: 9, scope: !223, inlinedAt: !232)
!258 = !DILocation(line: 93, column: 14, scope: !259, inlinedAt: !257)
!259 = distinct !DILexicalBlock(scope: !234, file: !188, line: 93, column: 6)
!260 = !DILocation(line: 93, column: 24, scope: !259, inlinedAt: !257)
!261 = !DILocation(line: 93, column: 6, scope: !234, inlinedAt: !257)
!262 = !DILocation(line: 99, column: 17, scope: !234, inlinedAt: !257)
!263 = !{!264, !264, i64 0}
!264 = !{!"short", !214, i64 0}
!265 = !DILocalVariable(name: "h_proto", arg: 1, scope: !266, file: !188, line: 68, type: !23)
!266 = distinct !DISubprogram(name: "proto_is_vlan", scope: !188, file: !188, line: 68, type: !267, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !269)
!267 = !DISubroutineType(types: !268)
!268 = !{!28, !23}
!269 = !{!265}
!270 = !DILocation(line: 0, scope: !266, inlinedAt: !271)
!271 = distinct !DILocation(line: 106, column: 8, scope: !272, inlinedAt: !257)
!272 = distinct !DILexicalBlock(scope: !273, file: !188, line: 106, column: 7)
!273 = distinct !DILexicalBlock(scope: !274, file: !188, line: 105, column: 39)
!274 = distinct !DILexicalBlock(scope: !275, file: !188, line: 105, column: 2)
!275 = distinct !DILexicalBlock(scope: !234, file: !188, line: 105, column: 2)
!276 = !DILocation(line: 70, column: 20, scope: !266, inlinedAt: !271)
!277 = !DILocation(line: 70, column: 46, scope: !266, inlinedAt: !271)
!278 = !DILocation(line: 106, column: 8, scope: !272, inlinedAt: !257)
!279 = !DILocation(line: 106, column: 7, scope: !273, inlinedAt: !257)
!280 = !DILocation(line: 112, column: 18, scope: !273, inlinedAt: !257)
!281 = !DILocation(line: 54, column: 15, scope: !194)
!282 = !DILocation(line: 54, column: 6, scope: !157)
!283 = !DILocation(line: 58, column: 24, scope: !193)
!284 = !DILocation(line: 0, scope: !193)
!285 = !DILocation(line: 66, column: 7, scope: !193)
!286 = !DILocation(line: 70, column: 15, scope: !287)
!287 = distinct !DILexicalBlock(scope: !288, file: !3, line: 70, column: 8)
!288 = distinct !DILexicalBlock(scope: !289, file: !3, line: 66, column: 18)
!289 = distinct !DILexicalBlock(scope: !193, file: !3, line: 66, column: 7)
!290 = !DILocation(line: 70, column: 19, scope: !287)
!291 = !DILocation(line: 70, column: 8, scope: !288)
!292 = !DILocation(line: 76, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !3, line: 76, column: 8)
!294 = !DILocation(line: 76, column: 18, scope: !293)
!295 = !DILocation(line: 76, column: 8, scope: !288)
!296 = !DILocation(line: 83, column: 15, scope: !297)
!297 = distinct !DILexicalBlock(scope: !288, file: !3, line: 83, column: 8)
!298 = !DILocation(line: 83, column: 19, scope: !297)
!299 = !DILocation(line: 83, column: 8, scope: !288)
!300 = !DILocation(line: 96, column: 15, scope: !301)
!301 = distinct !DILexicalBlock(scope: !302, file: !3, line: 96, column: 8)
!302 = distinct !DILexicalBlock(scope: !303, file: !3, line: 93, column: 23)
!303 = distinct !DILexicalBlock(scope: !289, file: !3, line: 93, column: 12)
!304 = !DILocation(line: 96, column: 18, scope: !301)
!305 = !DILocation(line: 96, column: 8, scope: !302)
!306 = !DILocation(line: 105, column: 15, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !3, line: 105, column: 8)
!308 = !DILocation(line: 105, column: 19, scope: !307)
!309 = !DILocation(line: 105, column: 8, scope: !302)
!310 = !DILocation(line: 115, column: 15, scope: !311)
!311 = distinct !DILexicalBlock(scope: !302, file: !3, line: 115, column: 8)
!312 = !DILocation(line: 115, column: 20, scope: !311)
!313 = !DILocation(line: 115, column: 8, scope: !302)
!314 = !DILocation(line: 125, column: 12, scope: !302)
!315 = !{!214, !214, i64 0}
!316 = !DILocation(line: 126, column: 7, scope: !302)
!317 = !DILocation(line: 126, column: 15, scope: !302)
!318 = !DILocation(line: 127, column: 15, scope: !302)
!319 = !DILocation(line: 129, column: 3, scope: !302)
!320 = !DILocation(line: 134, column: 15, scope: !321)
!321 = distinct !DILexicalBlock(scope: !322, file: !3, line: 134, column: 8)
!322 = distinct !DILexicalBlock(scope: !323, file: !3, line: 131, column: 24)
!323 = distinct !DILexicalBlock(scope: !303, file: !3, line: 131, column: 12)
!324 = !DILocation(line: 134, column: 19, scope: !321)
!325 = !DILocation(line: 134, column: 8, scope: !322)
!326 = !DILocation(line: 143, column: 15, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !3, line: 143, column: 8)
!328 = !DILocation(line: 143, column: 19, scope: !327)
!329 = !DILocation(line: 143, column: 8, scope: !322)
!330 = !DILocation(line: 152, column: 15, scope: !331)
!331 = distinct !DILexicalBlock(scope: !322, file: !3, line: 152, column: 8)
!332 = !DILocation(line: 152, column: 20, scope: !331)
!333 = !DILocation(line: 152, column: 8, scope: !322)
!334 = !DILocation(line: 162, column: 12, scope: !322)
!335 = !DILocation(line: 163, column: 7, scope: !322)
!336 = !DILocation(line: 163, column: 15, scope: !322)
!337 = !DILocation(line: 164, column: 15, scope: !322)
!338 = !DILocation(line: 165, column: 3, scope: !322)
!339 = !DILocation(line: 169, column: 15, scope: !340)
!340 = distinct !DILexicalBlock(scope: !341, file: !3, line: 169, column: 8)
!341 = distinct !DILexicalBlock(scope: !342, file: !3, line: 166, column: 23)
!342 = distinct !DILexicalBlock(scope: !323, file: !3, line: 166, column: 12)
!343 = !DILocation(line: 169, column: 19, scope: !340)
!344 = !DILocation(line: 169, column: 8, scope: !341)
!345 = !DILocation(line: 178, column: 15, scope: !346)
!346 = distinct !DILexicalBlock(scope: !341, file: !3, line: 178, column: 8)
!347 = !DILocation(line: 178, column: 20, scope: !346)
!348 = !DILocation(line: 178, column: 8, scope: !341)
!349 = !DILocation(line: 188, column: 12, scope: !341)
!350 = !DILocation(line: 0, scope: !303)
!351 = !DILocation(line: 196, column: 19, scope: !193)
!352 = !DILocation(line: 0, scope: !289)
!353 = !DILocation(line: 198, column: 51, scope: !193)
!354 = !DILocation(line: 198, column: 17, scope: !193)
!355 = !DILocation(line: 201, column: 13, scope: !202)
!356 = !DILocation(line: 201, column: 7, scope: !193)
!357 = !DILocation(line: 0, scope: !201)
!358 = !DILocation(line: 203, column: 19, scope: !359)
!359 = distinct !DILexicalBlock(scope: !201, file: !3, line: 203, column: 8)
!360 = !DILocation(line: 202, column: 41, scope: !201)
!361 = !DILocation(line: 204, column: 5, scope: !359)
!362 = !DILocation(line: 204, column: 24, scope: !359)
!363 = !{!213, !213, i64 0}
!364 = !DILocation(line: 205, column: 4, scope: !201)
!365 = !DILocation(line: 209, column: 18, scope: !366)
!366 = distinct !DILexicalBlock(scope: !193, file: !3, line: 209, column: 7)
!367 = !DILocation(line: 210, column: 4, scope: !366)
!368 = !DILocation(line: 210, column: 15, scope: !366)
!369 = !DILocation(line: 212, column: 3, scope: !193)
!370 = !DILocation(line: 216, column: 3, scope: !193)
!371 = !DILocation(line: 216, column: 7, scope: !193)
!372 = !DILocation(line: 217, column: 36, scope: !193)
!373 = !DILocation(line: 218, column: 36, scope: !193)
!374 = !DILocation(line: 219, column: 3, scope: !193)
!375 = !DILocation(line: 219, column: 53, scope: !193)
!376 = !DILocation(line: 219, column: 17, scope: !193)
!377 = !{!378, !378, i64 0}
!378 = !{!"long long", !214, i64 0}
!379 = !DILocation(line: 221, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !193, file: !3, line: 221, column: 7)
!381 = !DILocation(line: 221, column: 7, scope: !193)
!382 = !DILocation(line: 225, column: 24, scope: !383)
!383 = distinct !DILexicalBlock(scope: !380, file: !3, line: 224, column: 7)
!384 = !DILocation(line: 225, column: 21, scope: !383)
!385 = !DILocation(line: 0, scope: !380)
!386 = !DILocation(line: 231, column: 2, scope: !194)
!387 = !DILocation(line: 236, column: 1, scope: !157)
!388 = distinct !DISubprogram(name: "xdp_neural_network", scope: !3, file: !3, line: 242, type: !158, scopeLine: 243, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !389)
!389 = !{!390, !391, !392, !393, !394, !395, !396, !397, !400, !401, !402, !403, !404, !405, !408, !409, !410, !411, !412, !413, !414, !418, !420, !423, !424, !427, !428, !434, !435, !436, !437, !438}
!390 = !DILocalVariable(name: "ctx", arg: 1, scope: !388, file: !3, line: 242, type: !160)
!391 = !DILocalVariable(name: "start_time_parser", scope: !388, file: !3, line: 246, type: !34)
!392 = !DILocalVariable(name: "data_end", scope: !388, file: !3, line: 247, type: !21)
!393 = !DILocalVariable(name: "data", scope: !388, file: !3, line: 248, type: !21)
!394 = !DILocalVariable(name: "eth", scope: !388, file: !3, line: 249, type: !174)
!395 = !DILocalVariable(name: "nh", scope: !388, file: !3, line: 250, type: !187)
!396 = !DILocalVariable(name: "eth_type", scope: !388, file: !3, line: 251, type: !28)
!397 = !DILocalVariable(name: "size", scope: !398, file: !3, line: 265, type: !28)
!398 = distinct !DILexicalBlock(scope: !399, file: !3, line: 261, column: 38)
!399 = distinct !DILexicalBlock(scope: !388, file: !3, line: 261, column: 6)
!400 = !DILocalVariable(name: "ipv6", scope: !398, file: !3, line: 267, type: !26)
!401 = !DILocalVariable(name: "type", scope: !398, file: !3, line: 268, type: !26)
!402 = !DILocalVariable(name: "lastbyte", scope: !398, file: !3, line: 269, type: !26)
!403 = !DILocalVariable(name: "code", scope: !398, file: !3, line: 404, type: !28)
!404 = !DILocalVariable(name: "count", scope: !398, file: !3, line: 406, type: !29)
!405 = !DILocalVariable(name: "initial_count", scope: !406, file: !3, line: 410, type: !29)
!406 = distinct !DILexicalBlock(scope: !407, file: !3, line: 409, column: 21)
!407 = distinct !DILexicalBlock(scope: !398, file: !3, line: 409, column: 7)
!408 = !DILocalVariable(name: "time_parsing", scope: !398, file: !3, line: 424, type: !28)
!409 = !DILocalVariable(name: "total_parsing", scope: !398, file: !3, line: 425, type: !205)
!410 = !DILocalVariable(name: "end_time_parser", scope: !398, file: !3, line: 426, type: !34)
!411 = !DILocalVariable(name: "duration_parsing", scope: !398, file: !3, line: 427, type: !34)
!412 = !DILocalVariable(name: "time_ebpf", scope: !398, file: !3, line: 438, type: !28)
!413 = !DILocalVariable(name: "prev_time", scope: !398, file: !3, line: 439, type: !205)
!414 = !DILocalVariable(name: "start_time_nn", scope: !415, file: !3, line: 448, type: !34)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 444, column: 58)
!416 = distinct !DILexicalBlock(scope: !417, file: !3, line: 444, column: 12)
!417 = distinct !DILexicalBlock(scope: !398, file: !3, line: 441, column: 7)
!418 = !DILocalVariable(name: "i", scope: !419, file: !3, line: 450, type: !28)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 450, column: 4)
!420 = !DILocalVariable(name: "key", scope: !421, file: !3, line: 451, type: !27)
!421 = distinct !DILexicalBlock(scope: !422, file: !3, line: 450, column: 30)
!422 = distinct !DILexicalBlock(scope: !419, file: !3, line: 450, column: 4)
!423 = !DILocalVariable(name: "valores", scope: !421, file: !3, line: 452, type: !111)
!424 = !DILocalVariable(name: "entries", scope: !425, file: !3, line: 454, type: !111)
!425 = distinct !DILexicalBlock(scope: !426, file: !3, line: 453, column: 25)
!426 = distinct !DILexicalBlock(scope: !421, file: !3, line: 453, column: 9)
!427 = !DILocalVariable(name: "result", scope: !425, file: !3, line: 455, type: !28)
!428 = !DILocalVariable(name: "buf", scope: !429, file: !3, line: 458, type: !431)
!429 = distinct !DILexicalBlock(scope: !430, file: !3, line: 456, column: 22)
!430 = distinct !DILexicalBlock(scope: !425, file: !3, line: 456, column: 10)
!431 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 336, elements: !432)
!432 = !{!433}
!433 = !DISubrange(count: 42)
!434 = !DILocalVariable(name: "new_count", scope: !421, file: !3, line: 463, type: !29)
!435 = !DILocalVariable(name: "time_nn", scope: !415, file: !3, line: 468, type: !28)
!436 = !DILocalVariable(name: "total_nn", scope: !415, file: !3, line: 469, type: !205)
!437 = !DILocalVariable(name: "end_time_nn", scope: !415, file: !3, line: 471, type: !34)
!438 = !DILocalVariable(name: "duration_nn", scope: !415, file: !3, line: 472, type: !34)
!439 = !DILocation(line: 0, scope: !388)
!440 = !DILocation(line: 246, column: 2, scope: !388)
!441 = !DILocation(line: 246, column: 36, scope: !388)
!442 = !DILocation(line: 246, column: 16, scope: !388)
!443 = !DILocation(line: 247, column: 38, scope: !388)
!444 = !DILocation(line: 247, column: 27, scope: !388)
!445 = !DILocation(line: 247, column: 19, scope: !388)
!446 = !DILocation(line: 248, column: 34, scope: !388)
!447 = !DILocation(line: 248, column: 23, scope: !388)
!448 = !DILocation(line: 248, column: 15, scope: !388)
!449 = !DILocation(line: 0, scope: !223, inlinedAt: !450)
!450 = distinct !DILocation(line: 256, column: 13, scope: !388)
!451 = !DILocation(line: 0, scope: !234, inlinedAt: !452)
!452 = distinct !DILocation(line: 129, column: 9, scope: !223, inlinedAt: !450)
!453 = !DILocation(line: 93, column: 14, scope: !259, inlinedAt: !452)
!454 = !DILocation(line: 93, column: 24, scope: !259, inlinedAt: !452)
!455 = !DILocation(line: 93, column: 6, scope: !234, inlinedAt: !452)
!456 = !DILocation(line: 99, column: 17, scope: !234, inlinedAt: !452)
!457 = !DILocation(line: 0, scope: !266, inlinedAt: !458)
!458 = distinct !DILocation(line: 106, column: 8, scope: !272, inlinedAt: !452)
!459 = !DILocation(line: 70, column: 20, scope: !266, inlinedAt: !458)
!460 = !DILocation(line: 70, column: 46, scope: !266, inlinedAt: !458)
!461 = !DILocation(line: 106, column: 8, scope: !272, inlinedAt: !452)
!462 = !DILocation(line: 106, column: 7, scope: !273, inlinedAt: !452)
!463 = !DILocation(line: 112, column: 18, scope: !273, inlinedAt: !452)
!464 = !DILocation(line: 261, column: 15, scope: !399)
!465 = !DILocation(line: 261, column: 6, scope: !388)
!466 = !DILocation(line: 265, column: 24, scope: !398)
!467 = !DILocation(line: 0, scope: !398)
!468 = !DILocation(line: 273, column: 7, scope: !398)
!469 = !DILocation(line: 277, column: 15, scope: !470)
!470 = distinct !DILexicalBlock(scope: !471, file: !3, line: 277, column: 8)
!471 = distinct !DILexicalBlock(scope: !472, file: !3, line: 273, column: 18)
!472 = distinct !DILexicalBlock(scope: !398, file: !3, line: 273, column: 7)
!473 = !DILocation(line: 277, column: 19, scope: !470)
!474 = !DILocation(line: 277, column: 8, scope: !471)
!475 = !DILocation(line: 283, column: 13, scope: !476)
!476 = distinct !DILexicalBlock(scope: !471, file: !3, line: 283, column: 8)
!477 = !DILocation(line: 283, column: 18, scope: !476)
!478 = !DILocation(line: 283, column: 8, scope: !471)
!479 = !DILocation(line: 290, column: 15, scope: !480)
!480 = distinct !DILexicalBlock(scope: !471, file: !3, line: 290, column: 8)
!481 = !DILocation(line: 290, column: 19, scope: !480)
!482 = !DILocation(line: 290, column: 8, scope: !471)
!483 = !DILocation(line: 303, column: 15, scope: !484)
!484 = distinct !DILexicalBlock(scope: !485, file: !3, line: 303, column: 8)
!485 = distinct !DILexicalBlock(scope: !486, file: !3, line: 300, column: 23)
!486 = distinct !DILexicalBlock(scope: !472, file: !3, line: 300, column: 12)
!487 = !DILocation(line: 303, column: 18, scope: !484)
!488 = !DILocation(line: 303, column: 8, scope: !485)
!489 = !DILocation(line: 313, column: 15, scope: !490)
!490 = distinct !DILexicalBlock(scope: !485, file: !3, line: 313, column: 8)
!491 = !DILocation(line: 313, column: 19, scope: !490)
!492 = !DILocation(line: 313, column: 8, scope: !485)
!493 = !DILocation(line: 323, column: 15, scope: !494)
!494 = distinct !DILexicalBlock(scope: !485, file: !3, line: 323, column: 8)
!495 = !DILocation(line: 323, column: 20, scope: !494)
!496 = !DILocation(line: 323, column: 8, scope: !485)
!497 = !DILocation(line: 333, column: 12, scope: !485)
!498 = !DILocation(line: 334, column: 7, scope: !485)
!499 = !DILocation(line: 334, column: 15, scope: !485)
!500 = !DILocation(line: 335, column: 15, scope: !485)
!501 = !DILocation(line: 337, column: 3, scope: !485)
!502 = !DILocation(line: 342, column: 15, scope: !503)
!503 = distinct !DILexicalBlock(scope: !504, file: !3, line: 342, column: 8)
!504 = distinct !DILexicalBlock(scope: !505, file: !3, line: 339, column: 24)
!505 = distinct !DILexicalBlock(scope: !486, file: !3, line: 339, column: 12)
!506 = !DILocation(line: 342, column: 19, scope: !503)
!507 = !DILocation(line: 342, column: 8, scope: !504)
!508 = !DILocation(line: 351, column: 15, scope: !509)
!509 = distinct !DILexicalBlock(scope: !504, file: !3, line: 351, column: 8)
!510 = !DILocation(line: 351, column: 19, scope: !509)
!511 = !DILocation(line: 351, column: 8, scope: !504)
!512 = !DILocation(line: 360, column: 15, scope: !513)
!513 = distinct !DILexicalBlock(scope: !504, file: !3, line: 360, column: 8)
!514 = !DILocation(line: 360, column: 20, scope: !513)
!515 = !DILocation(line: 360, column: 8, scope: !504)
!516 = !DILocation(line: 370, column: 12, scope: !504)
!517 = !DILocation(line: 371, column: 7, scope: !504)
!518 = !DILocation(line: 371, column: 15, scope: !504)
!519 = !DILocation(line: 372, column: 15, scope: !504)
!520 = !DILocation(line: 373, column: 3, scope: !504)
!521 = !DILocation(line: 377, column: 15, scope: !522)
!522 = distinct !DILexicalBlock(scope: !523, file: !3, line: 377, column: 8)
!523 = distinct !DILexicalBlock(scope: !524, file: !3, line: 374, column: 23)
!524 = distinct !DILexicalBlock(scope: !505, file: !3, line: 374, column: 12)
!525 = !DILocation(line: 377, column: 19, scope: !522)
!526 = !DILocation(line: 377, column: 8, scope: !523)
!527 = !DILocation(line: 386, column: 15, scope: !528)
!528 = distinct !DILexicalBlock(scope: !523, file: !3, line: 386, column: 8)
!529 = !DILocation(line: 386, column: 20, scope: !528)
!530 = !DILocation(line: 386, column: 8, scope: !523)
!531 = !DILocation(line: 396, column: 12, scope: !523)
!532 = !DILocation(line: 0, scope: !486)
!533 = !DILocation(line: 404, column: 19, scope: !398)
!534 = !DILocation(line: 0, scope: !472)
!535 = !DILocation(line: 406, column: 51, scope: !398)
!536 = !DILocation(line: 406, column: 17, scope: !398)
!537 = !DILocation(line: 409, column: 13, scope: !407)
!538 = !DILocation(line: 409, column: 7, scope: !398)
!539 = !DILocation(line: 0, scope: !406)
!540 = !DILocation(line: 411, column: 19, scope: !541)
!541 = distinct !DILexicalBlock(scope: !406, file: !3, line: 411, column: 8)
!542 = !DILocation(line: 410, column: 41, scope: !406)
!543 = !DILocation(line: 412, column: 5, scope: !541)
!544 = !DILocation(line: 412, column: 24, scope: !541)
!545 = !DILocation(line: 413, column: 44, scope: !406)
!546 = !DILocation(line: 413, column: 4, scope: !406)
!547 = !DILocation(line: 417, column: 18, scope: !548)
!548 = distinct !DILexicalBlock(scope: !398, file: !3, line: 417, column: 7)
!549 = !DILocation(line: 418, column: 4, scope: !548)
!550 = !DILocation(line: 418, column: 15, scope: !548)
!551 = !DILocation(line: 420, column: 3, scope: !398)
!552 = !DILocation(line: 424, column: 3, scope: !398)
!553 = !DILocation(line: 424, column: 7, scope: !398)
!554 = !DILocation(line: 425, column: 36, scope: !398)
!555 = !DILocation(line: 426, column: 3, scope: !398)
!556 = !DILocation(line: 426, column: 36, scope: !398)
!557 = !DILocation(line: 426, column: 17, scope: !398)
!558 = !DILocation(line: 427, column: 3, scope: !398)
!559 = !DILocation(line: 427, column: 55, scope: !398)
!560 = !DILocation(line: 427, column: 53, scope: !398)
!561 = !DILocation(line: 427, column: 17, scope: !398)
!562 = !DILocation(line: 429, column: 21, scope: !563)
!563 = distinct !DILexicalBlock(scope: !398, file: !3, line: 429, column: 7)
!564 = !DILocation(line: 429, column: 7, scope: !398)
!565 = !DILocation(line: 433, column: 24, scope: !566)
!566 = distinct !DILexicalBlock(scope: !563, file: !3, line: 432, column: 7)
!567 = !DILocation(line: 433, column: 21, scope: !566)
!568 = !DILocation(line: 0, scope: !563)
!569 = !DILocation(line: 438, column: 3, scope: !398)
!570 = !DILocation(line: 438, column: 7, scope: !398)
!571 = !DILocation(line: 439, column: 31, scope: !398)
!572 = !DILocation(line: 441, column: 17, scope: !417)
!573 = !DILocation(line: 441, column: 7, scope: !398)
!574 = !DILocation(line: 442, column: 4, scope: !575)
!575 = distinct !DILexicalBlock(scope: !417, file: !3, line: 441, column: 26)
!576 = !DILocation(line: 443, column: 3, scope: !575)
!577 = !DILocation(line: 444, column: 13, scope: !416)
!578 = !DILocation(line: 444, column: 31, scope: !416)
!579 = !DILocation(line: 444, column: 29, scope: !416)
!580 = !DILocation(line: 444, column: 44, scope: !416)
!581 = !DILocation(line: 444, column: 12, scope: !417)
!582 = !DILocation(line: 445, column: 4, scope: !415)
!583 = !DILocation(line: 448, column: 34, scope: !415)
!584 = !DILocation(line: 0, scope: !415)
!585 = !DILocation(line: 0, scope: !419)
!586 = !DILocation(line: 451, column: 5, scope: !421)
!587 = !DILocation(line: 0, scope: !421)
!588 = !DILocation(line: 451, column: 19, scope: !421)
!589 = !DILocation(line: 452, column: 25, scope: !421)
!590 = !DILocation(line: 453, column: 17, scope: !426)
!591 = !DILocation(line: 453, column: 9, scope: !421)
!592 = !DILocation(line: 454, column: 41, scope: !425)
!593 = !DILocation(line: 454, column: 52, scope: !425)
!594 = !DILocation(line: 454, column: 64, scope: !425)
!595 = !DILocation(line: 454, column: 76, scope: !425)
!596 = !DILocation(line: 0, scope: !425)
!597 = !DILocalVariable(name: "in", arg: 1, scope: !598, file: !15, line: 328, type: !111)
!598 = distinct !DISubprogram(name: "model_predict", scope: !15, file: !15, line: 328, type: !599, scopeLine: 329, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !601)
!599 = !DISubroutineType(types: !600)
!600 = !{!35, !111}
!601 = !{!597, !602}
!602 = !DILocalVariable(name: "fix_entries", scope: !598, file: !15, line: 330, type: !140)
!603 = !DILocation(line: 0, scope: !598, inlinedAt: !604)
!604 = distinct !DILocation(line: 455, column: 19, scope: !425)
!605 = !DILocalVariable(name: "entrie", arg: 1, scope: !606, file: !15, line: 317, type: !35)
!606 = distinct !DISubprogram(name: "to_fix", scope: !15, file: !15, line: 317, type: !607, scopeLine: 317, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !609)
!607 = !DISubroutineType(types: !608)
!608 = !{!35, !35}
!609 = !{!605, !610, !611}
!610 = !DILocalVariable(name: "a", scope: !606, file: !15, line: 318, type: !35)
!611 = !DILocalVariable(name: "output", scope: !606, file: !15, line: 319, type: !35)
!612 = !DILocation(line: 0, scope: !606, inlinedAt: !613)
!613 = distinct !DILocation(line: 330, column: 31, scope: !598, inlinedAt: !604)
!614 = !DILocation(line: 318, column: 24, scope: !606, inlinedAt: !613)
!615 = !DILocation(line: 0, scope: !606, inlinedAt: !616)
!616 = distinct !DILocation(line: 330, column: 46, scope: !598, inlinedAt: !604)
!617 = !DILocation(line: 318, column: 24, scope: !606, inlinedAt: !616)
!618 = !DILocation(line: 0, scope: !606, inlinedAt: !619)
!619 = distinct !DILocation(line: 330, column: 61, scope: !598, inlinedAt: !604)
!620 = !DILocation(line: 318, column: 24, scope: !606, inlinedAt: !619)
!621 = !DILocation(line: 0, scope: !606, inlinedAt: !622)
!622 = distinct !DILocation(line: 330, column: 76, scope: !598, inlinedAt: !604)
!623 = !DILocation(line: 318, column: 24, scope: !606, inlinedAt: !622)
!624 = !DILocalVariable(name: "features", arg: 2, scope: !625, file: !15, line: 303, type: !111)
!625 = distinct !DISubprogram(name: "eml_net_predict", scope: !15, file: !15, line: 303, type: !626, scopeLine: 303, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !630)
!626 = !DISubroutineType(types: !627)
!627 = !{!35, !628, !111}
!628 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !629, size: 64)
!629 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !92)
!630 = !{!631, !624, !632, !633}
!631 = !DILocalVariable(name: "model", arg: 1, scope: !625, file: !15, line: 303, type: !628)
!632 = !DILocalVariable(name: "out_fix", scope: !625, file: !15, line: 306, type: !35)
!633 = !DILocalVariable(name: "out_int", scope: !625, file: !15, line: 307, type: !35)
!634 = !DILocation(line: 0, scope: !625, inlinedAt: !635)
!635 = distinct !DILocation(line: 331, column: 12, scope: !598, inlinedAt: !604)
!636 = !DILocalVariable(name: "features", arg: 2, scope: !637, file: !15, line: 275, type: !111)
!637 = distinct !DISubprogram(name: "eml_net_infer", scope: !15, file: !15, line: 275, type: !626, scopeLine: 275, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !638)
!638 = !{!639, !636, !640, !641, !642, !644, !647}
!639 = !DILocalVariable(name: "model", arg: 1, scope: !637, file: !15, line: 275, type: !628)
!640 = !DILocalVariable(name: "buffer1", scope: !637, file: !15, line: 278, type: !111)
!641 = !DILocalVariable(name: "buffer2", scope: !637, file: !15, line: 279, type: !111)
!642 = !DILocalVariable(name: "l", scope: !643, file: !15, line: 286, type: !28)
!643 = distinct !DILexicalBlock(scope: !637, file: !15, line: 286, column: 5)
!644 = !DILocalVariable(name: "layer", scope: !645, file: !15, line: 287, type: !97)
!645 = distinct !DILexicalBlock(scope: !646, file: !15, line: 286, column: 38)
!646 = distinct !DILexicalBlock(scope: !643, file: !15, line: 286, column: 5)
!647 = !DILocalVariable(name: "i", scope: !648, file: !15, line: 291, type: !28)
!648 = distinct !DILexicalBlock(scope: !645, file: !15, line: 291, column: 6)
!649 = !DILocation(line: 0, scope: !637, inlinedAt: !650)
!650 = distinct !DILocation(line: 304, column: 5, scope: !625, inlinedAt: !635)
!651 = !{}
!652 = !DILocalVariable(name: "layer", arg: 1, scope: !653, file: !15, line: 237, type: !97)
!653 = distinct !DISubprogram(name: "eml_net_layer_forward", scope: !15, file: !15, line: 237, type: !654, scopeLine: 237, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !656)
!654 = !DISubroutineType(types: !655)
!655 = !{!35, !97, !111, !111, !35}
!656 = !{!652, !657, !658, !659, !660, !661, !662, !664, !667, !669}
!657 = !DILocalVariable(name: "in", arg: 2, scope: !653, file: !15, line: 237, type: !111)
!658 = !DILocalVariable(name: "out", arg: 3, scope: !653, file: !15, line: 237, type: !111)
!659 = !DILocalVariable(name: "n_layer", arg: 4, scope: !653, file: !15, line: 237, type: !35)
!660 = !DILocalVariable(name: "w_idx", scope: !653, file: !15, line: 239, type: !28)
!661 = !DILocalVariable(name: "w", scope: !653, file: !15, line: 240, type: !35)
!662 = !DILocalVariable(name: "o", scope: !663, file: !15, line: 243, type: !28)
!663 = distinct !DILexicalBlock(scope: !653, file: !15, line: 243, column: 5)
!664 = !DILocalVariable(name: "sum", scope: !665, file: !15, line: 244, type: !35)
!665 = distinct !DILexicalBlock(scope: !666, file: !15, line: 243, column: 46)
!666 = distinct !DILexicalBlock(scope: !663, file: !15, line: 243, column: 5)
!667 = !DILocalVariable(name: "i", scope: !668, file: !15, line: 246, type: !28)
!668 = distinct !DILexicalBlock(scope: !665, file: !15, line: 246, column: 9)
!669 = !DILocalVariable(name: "i", scope: !670, file: !15, line: 263, type: !28)
!670 = distinct !DILexicalBlock(scope: !671, file: !15, line: 263, column: 6)
!671 = distinct !DILexicalBlock(scope: !672, file: !15, line: 261, column: 59)
!672 = distinct !DILexicalBlock(scope: !673, file: !15, line: 261, column: 16)
!673 = distinct !DILexicalBlock(scope: !653, file: !15, line: 259, column: 9)
!674 = !DILocation(line: 0, scope: !653, inlinedAt: !675)
!675 = distinct !DILocation(line: 282, column: 5, scope: !637, inlinedAt: !650)
!676 = !DILocation(line: 0, scope: !663, inlinedAt: !675)
!677 = !DILocation(line: 0, scope: !668, inlinedAt: !675)
!678 = !DILocation(line: 0, scope: !665, inlinedAt: !675)
!679 = !DILocalVariable(name: "a", arg: 1, scope: !680, file: !15, line: 229, type: !35)
!680 = distinct !DISubprogram(name: "mult", scope: !15, file: !15, line: 229, type: !681, scopeLine: 229, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !683)
!681 = !DISubroutineType(types: !682)
!682 = !{!35, !35, !35}
!683 = !{!679, !684, !685}
!684 = !DILocalVariable(name: "b", arg: 2, scope: !680, file: !15, line: 229, type: !35)
!685 = !DILocalVariable(name: "prod", scope: !680, file: !15, line: 230, type: !30)
!686 = !DILocation(line: 0, scope: !680, inlinedAt: !687)
!687 = distinct !DILocation(line: 249, column: 20, scope: !688, inlinedAt: !675)
!688 = distinct !DILexicalBlock(scope: !689, file: !15, line: 246, column: 47)
!689 = distinct !DILexicalBlock(scope: !668, file: !15, line: 246, column: 9)
!690 = !DILocation(line: 230, column: 33, scope: !680, inlinedAt: !687)
!691 = !DILocation(line: 230, column: 31, scope: !680, inlinedAt: !687)
!692 = !DILocation(line: 231, column: 10, scope: !680, inlinedAt: !687)
!693 = !DILocation(line: 232, column: 12, scope: !680, inlinedAt: !687)
!694 = !DILocation(line: 249, column: 17, scope: !688, inlinedAt: !675)
!695 = !DILocation(line: 252, column: 22, scope: !665, inlinedAt: !675)
!696 = !DILocation(line: 0, scope: !670, inlinedAt: !675)
!697 = !DILocation(line: 0, scope: !643, inlinedAt: !650)
!698 = !DILocation(line: 0, scope: !645, inlinedAt: !650)
!699 = !DILocation(line: 0, scope: !653, inlinedAt: !700)
!700 = distinct !DILocation(line: 289, column: 9, scope: !645, inlinedAt: !650)
!701 = !DILocation(line: 0, scope: !663, inlinedAt: !700)
!702 = !DILocation(line: 0, scope: !668, inlinedAt: !700)
!703 = !DILocation(line: 0, scope: !665, inlinedAt: !700)
!704 = !DILocation(line: 0, scope: !680, inlinedAt: !705)
!705 = distinct !DILocation(line: 249, column: 20, scope: !688, inlinedAt: !700)
!706 = !DILocation(line: 230, column: 33, scope: !680, inlinedAt: !705)
!707 = !DILocation(line: 230, column: 31, scope: !680, inlinedAt: !705)
!708 = !DILocation(line: 231, column: 10, scope: !680, inlinedAt: !705)
!709 = !DILocation(line: 232, column: 12, scope: !680, inlinedAt: !705)
!710 = !DILocation(line: 249, column: 17, scope: !688, inlinedAt: !700)
!711 = !DILocation(line: 252, column: 22, scope: !665, inlinedAt: !700)
!712 = !DILocation(line: 0, scope: !670, inlinedAt: !700)
!713 = !DILocation(line: 0, scope: !648, inlinedAt: !650)
!714 = !DILocation(line: 0, scope: !653, inlinedAt: !715)
!715 = distinct !DILocation(line: 297, column: 5, scope: !637, inlinedAt: !650)
!716 = !DILocation(line: 0, scope: !663, inlinedAt: !715)
!717 = !DILocation(line: 0, scope: !668, inlinedAt: !715)
!718 = !DILocation(line: 0, scope: !665, inlinedAt: !715)
!719 = !DILocation(line: 0, scope: !680, inlinedAt: !720)
!720 = distinct !DILocation(line: 249, column: 20, scope: !688, inlinedAt: !715)
!721 = !DILocation(line: 230, column: 33, scope: !680, inlinedAt: !720)
!722 = !DILocation(line: 230, column: 31, scope: !680, inlinedAt: !720)
!723 = !DILocation(line: 231, column: 10, scope: !680, inlinedAt: !720)
!724 = !DILocation(line: 232, column: 12, scope: !680, inlinedAt: !720)
!725 = !DILocation(line: 0, scope: !670, inlinedAt: !715)
!726 = !DILocation(line: 309, column: 17, scope: !727, inlinedAt: !635)
!727 = distinct !DILexicalBlock(scope: !625, file: !15, line: 309, column: 9)
!728 = !DILocation(line: 456, column: 10, scope: !425)
!729 = !DILocation(line: 458, column: 7, scope: !429)
!730 = !DILocation(line: 458, column: 12, scope: !429)
!731 = !DILocation(line: 459, column: 45, scope: !429)
!732 = !DILocation(line: 459, column: 50, scope: !429)
!733 = !DILocation(line: 459, column: 10, scope: !429)
!734 = !DILocation(line: 460, column: 6, scope: !430)
!735 = !DILocation(line: 460, column: 6, scope: !429)
!736 = !DILocation(line: 464, column: 5, scope: !421)
!737 = !DILocation(line: 463, column: 38, scope: !421)
!738 = !DILocation(line: 465, column: 4, scope: !422)
!739 = !DILocation(line: 468, column: 4, scope: !415)
!740 = !DILocation(line: 468, column: 8, scope: !415)
!741 = !DILocation(line: 469, column: 32, scope: !415)
!742 = !DILocation(line: 471, column: 32, scope: !415)
!743 = !DILocation(line: 472, column: 4, scope: !415)
!744 = !DILocation(line: 472, column: 45, scope: !415)
!745 = !DILocation(line: 472, column: 18, scope: !415)
!746 = !DILocation(line: 474, column: 17, scope: !747)
!747 = distinct !DILexicalBlock(scope: !415, file: !3, line: 474, column: 8)
!748 = !DILocation(line: 474, column: 8, scope: !415)
!749 = !DILocation(line: 478, column: 20, scope: !750)
!750 = distinct !DILexicalBlock(scope: !747, file: !3, line: 477, column: 8)
!751 = !DILocation(line: 478, column: 17, scope: !750)
!752 = !DILocation(line: 0, scope: !747)
!753 = !DILocation(line: 481, column: 3, scope: !416)
!754 = !DILocation(line: 481, column: 3, scope: !415)
!755 = !DILocation(line: 484, column: 2, scope: !399)
!756 = !DILocation(line: 489, column: 1, scope: !388)
