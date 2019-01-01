.class public final Landroid/provider/MiuiSettings$ForceTouch;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ForceTouch"
.end annotation


# static fields
.field private static final ForceTouchEnable:Ljava/lang/String; = "force_touch_enable"

.field private static mDeepPress:F

.field private static mLightPress:F

.field private static mSupportForceTouch:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6284
    const/4 v0, -0x1

    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    .line 6285
    const/high16 v0, -0x40800000    # -1.0f

    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mLightPress:F

    .line 6286
    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mDeepPress:F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkHighend()V
    .locals 7

    .line 6331
    const-string/jumbo v0, "ro.product.device"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 6332
    .local v0, "device":Ljava/lang/String;
    const-string v1, "capricorn"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 6333
    invoke-static {}, Landroid/provider/MiuiSettings$ForceTouch;->getTotalInternalMemory()J

    move-result-wide v1

    .line 6334
    .local v1, "internalMemroyRom":J
    invoke-static {}, Lmiui/util/HardwareInfo;->getTotalPhysicalMemory()J

    move-result-wide v3

    .line 6335
    .local v3, "ram":J
    const-wide v5, 0x1dcd650000L

    cmp-long v5, v1, v5

    if-ltz v5, :cond_0

    const-wide v5, 0xee6b2800L

    cmp-long v5, v3, v5

    if-gez v5, :cond_1

    .line 6336
    :cond_0
    const/4 v5, 0x0

    sput v5, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    .line 6339
    .end local v1    # "internalMemroyRom":J
    .end local v3    # "ram":J
    :cond_1
    return-void
.end method

.method public static getDeepPressure()F
    .locals 2

    .line 6324
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mDeepPress:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 6325
    const-string v0, "force_touch_deep"

    const v1, 0x3f4ccccd    # 0.8f

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mDeepPress:F

    .line 6327
    :cond_0
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mDeepPress:F

    return v0
.end method

.method public static getLightPressure()F
    .locals 2

    .line 6317
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mLightPress:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 6318
    const-string v0, "force_touch_light"

    const v1, 0x3ecccccd    # 0.4f

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mLightPress:F

    .line 6320
    :cond_0
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mLightPress:F

    return v0
.end method

.method private static getTotalInternalMemory()J
    .locals 15

    .line 6342
    const-wide/16 v0, 0x0

    .line 6343
    .local v0, "totalSize":J
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 6344
    .local v2, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6346
    const-string/jumbo v3, "mixed"

    const-string/jumbo v4, "ro.boot.sdcard.type"

    const-string/jumbo v5, "mixed"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 6347
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    .line 6348
    .local v3, "state":Ljava/lang/String;
    const-string/jumbo v4, "mounted"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, "mounted_ro"

    .line 6349
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 6350
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6354
    .end local v3    # "state":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 6355
    .local v4, "path":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v5

    add-long/2addr v0, v5

    .line 6356
    .end local v4    # "path":Ljava/io/File;
    goto :goto_0

    .line 6358
    :cond_2
    move-wide v3, v0

    .line 6359
    .local v3, "totalInternalMemory":J
    const-wide/32 v5, 0xf4240

    .line 6360
    .local v5, "MB":J
    const-wide/32 v7, 0x3b9aca00

    .line 6361
    .local v7, "GB":J
    const-wide/16 v9, 0x8

    mul-long/2addr v9, v7

    cmp-long v9, v3, v9

    if-ltz v9, :cond_3

    .line 6362
    div-long v9, v3, v7

    long-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    move-result-wide v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v13

    div-double/2addr v9, v13

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    double-to-long v9, v9

    mul-long/2addr v9, v7

    .end local v3    # "totalInternalMemory":J
    .local v9, "totalInternalMemory":J
    :goto_1
    goto :goto_2

    .line 6364
    .end local v9    # "totalInternalMemory":J
    .restart local v3    # "totalInternalMemory":J
    :cond_3
    div-long v9, v3, v7

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    mul-long/2addr v9, v7

    goto :goto_1

    .line 6366
    .end local v3    # "totalInternalMemory":J
    .restart local v9    # "totalInternalMemory":J
    :goto_2
    return-wide v9
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 6299
    invoke-static {}, Landroid/provider/MiuiSettings$ForceTouch;->isSupport()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 6300
    return v1

    .line 6302
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 6303
    .local v0, "resolver":Landroid/content/ContentResolver;
    const-string v2, "force_touch_enable"

    const/4 v3, 0x1

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 6304
    .local v2, "enable":I
    if-eqz v2, :cond_1

    move v1, v3

    nop

    :cond_1
    return v1
.end method

.method public static isSupport()Z
    .locals 3

    .line 6289
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gez v0, :cond_0

    .line 6290
    const-string/jumbo v0, "support_force_touch"

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput v0, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    .line 6291
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    if-ne v0, v2, :cond_0

    .line 6292
    invoke-static {}, Landroid/provider/MiuiSettings$ForceTouch;->checkHighend()V

    .line 6295
    :cond_0
    sget v0, Landroid/provider/MiuiSettings$ForceTouch;->mSupportForceTouch:I

    if-ne v0, v2, :cond_1

    move v1, v2

    nop

    :cond_1
    return v1
.end method

.method public static setEnabled(Landroid/content/Context;Z)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # Z

    .line 6308
    invoke-static {}, Landroid/provider/MiuiSettings$ForceTouch;->isSupport()Z

    move-result v0

    if-nez v0, :cond_0

    .line 6309
    const/4 v0, 0x0

    return v0

    .line 6311
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 6312
    .local v0, "resolver":Landroid/content/ContentResolver;
    const-string v1, "force_touch_enable"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 6313
    const/4 v1, 0x1

    return v1
.end method
