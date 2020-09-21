Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B191271A4B
	for <lists+linux-remoteproc@lfdr.de>; Mon, 21 Sep 2020 07:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgIUFJP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 21 Sep 2020 01:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgIUFJP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 01:09:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B45AC061755;
        Sun, 20 Sep 2020 22:09:15 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id g4so11255204wrs.5;
        Sun, 20 Sep 2020 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YyUsC659D0QZp8PCniNjlLYmNDGwZ7vpKOsOehvIvyA=;
        b=cvy4LKeJFHfO8B6kkbI1TFe7hRIafMOWfoEVEUUzk97Vr8Ll9wayRSgUedem2uugvL
         mB21ba17/qJ0Az1RBVZvQpmTU+afyouU29J4szaaBW2MlJsHIP31KGr0cTf+30Sc1aU/
         ATZ+l8Z6ntA+FB05mmI+gChpeJLxiEFCfCzd0xf50GMbaGAdrmPGa/ahsy3aFfyWafj+
         EZdH3UL92+w2TOthKepeNVUf0ZcngHDtOJ5xhKwoiKD+vaITcQ1zEQP0GEk31CDTxepN
         1YGaHDwRChCIZNfMLnQep+aqvtBZvX0NAh/YXzgaXPSFjV/nRKBcdVvnjjzV8gQn7jKv
         qVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YyUsC659D0QZp8PCniNjlLYmNDGwZ7vpKOsOehvIvyA=;
        b=qEhzYUNaNgwTZUZeq4/rk8UlrwzrqyghateJq/9cpdASOkKDqx6t0H2ZtlSWpnTS8k
         JT1V+LsGUUzNvXNJuccNNKde1P0cQxuyhwEjZ6oSJTydIACiP3wp6tGH+QEUkpgWvLjn
         /4aU/nEY57DLVCfXGylyAXjpr0pJAPWdPSkQWVRnva3/r7VR1+fiIMJl/TKIy1NpOEfF
         jUXQgAN/ttggK1gm+ap83YWkUNSNkTRfrB/GEyKrsp1pgLFB8qf4WXzsXe0r+yTjPuOx
         /m1z09qzYIPaPrr2jwBtMju0hgO3zc+ITpKis+dCCH5T0GvGZ5g6p0o+71gscFPFfGKV
         iCdA==
X-Gm-Message-State: AOAM530IqYW4TmQlgLfrdZMF4p6o24ac38jkubA53OmBMVtXdfisYS4k
        QI4L7sRIjrBQEvP0MXqqVx/i64DwgdWm845xvNs=
X-Google-Smtp-Source: ABdhPJyYG+ZNF2X6zrZmaZX9NLjjzBxx0+kSIQf71+HilUTdDGRx1t62ei3S+FCPGRmjSQ/yCXSztxBe76AFdZUDF+g=
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr53930785wrn.394.1600664953814;
 Sun, 20 Sep 2020 22:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com> <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918160721.GD15530@xaphan> <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918190643.GA172254@xaphan> <CAA07jV9WfTTLRwh3kmy1985p4C1m37wQJQAHzLdK2cn4f8HENw@mail.gmail.com>
 <BYAPR02MB4407AA5D63EBAC7BEC93CB62B53D0@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4407AA5D63EBAC7BEC93CB62B53D0@BYAPR02MB4407.namprd02.prod.outlook.com>
From:   Wendy Liang <sunnyliangjy@gmail.com>
Date:   Sun, 20 Sep 2020 22:09:02 -0700
Message-ID: <CAA07jV-4q5ifdqGkVQSKTCsErcx9oK9vPx0+yyN_8piXY0w9Fg@mail.gmail.com>
Subject: Re: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     Michael Auchter <michael.auchter@ni.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Wendy Liang <wendy.liang@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Ben,

On Sun, Sep 20, 2020 at 4:16 PM Ben Levinsky <BLEVINSK@xilinx.com> wrote:
>
> Hi All,
>
> > -----Original Message-----
> > From: Wendy Liang <sunnyliangjy@gmail.com>
> > Sent: Friday, September 18, 2020 6:53 PM
> > To: Michael Auchter <michael.auchter@ni.com>
> > Cc: Ben Levinsky <BLEVINSK@xilinx.com>; punit1.agrawal@toshiba.co.jp;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
> > remoteproc driver
> >
> > HI Michael, Ben, Punit,
> >
> > On Fri, Sep 18, 2020 at 12:08 PM Michael Auchter <michael.auchter@ni.co=
m>
> > wrote:
> > >
> > > Hey Ben,
> > >
> > > On Fri, Sep 18, 2020 at 06:01:19PM +0000, Ben Levinsky wrote:
> > > > Hi Michael, Punit,
> > > >
> > > > > -----Original Message-----
> > > > > From: Michael Auchter <michael.auchter@ni.com>
> > > > > Sent: Friday, September 18, 2020 9:07 AM
> > > > > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > > > > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > linux-
> > > > > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > > > Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R=
5
> > > > > remoteproc driver
> > > > >
> > > > > On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:
> > > > > > In addition to device tree, is there particular linker script y=
ou use
> > > > > > for your R5 application? For example with OCM? As presently thi=
s
> > > > > > driver only has DDR and TCM as supported regions to load into
> > > > >
> > > > > The firmware is being loaded to TCM.
> > > > >
> > > > > I'm able to use this driver to load and run my firmware on both R=
5
> > > > > cores, but only after I change the incorrect:
> > > > >
> > > > >     rpu_mode =3D lockstep_mode
> > > > >
> > > > > assignment to:
> > > > >
> > > > >     rpu_mode =3D lockstep_mode ? PM_RPU_MODE_LOCKSTEP
> > > > >                              : PM_RPU_MODE_SPLIT;
> > > > There was a point raised by Punit that as "it is possible to set R5=
 to
> > > > operatore in split or lock-step mode dynamically" which is true and
> > > > can be done via sysfs and the Xilinx firmware kernel code.
> > >
> > > I'm not familiar with this, and don't see an obvious way to do this
> > > (from looking at drivers/firmware/xilinx/). Can you point me to this
> > > code?
> > >
> [Ben Levinsky] A way to do this, though it seems later comments show it i=
s not an implementation to pursue, is use the RPU configuration API and pre=
sent it via sysfs interface a la https://xilinx-wiki.atlassian.net/wiki/spa=
ces/A/pages/18842232/Zynq+UltraScale+MPSoC+Power+Management+-+Linux+Kernel#=
ZynqUltraScale%EF%BC%8BMPSoCPowerManagement-LinuxKernel-EnableClock
> > > > A suggestion that might clean up the driver so that the whole
> > > > rpu_mode, tcm_mode configuration can be simplified and pulled out o=
f
> > > > the driver:
> > > > - as Punit suggested, remove the lockstep-mode property
> > > > - the zynqmp_remoteproc_r5 driver ONLY loads firmware and does
> > start/stop.
> > > > - the zynqmp_remoteproc_r5 driver does not configure and memory
> > regions or the RPU. Let the Xilinx firmware sysfs interface handle this=
.
> > >
> > > I don't think this is a good approach.
> [Ben Levinsky] ok, noted. Can keep the configuration but still as wendy s=
aid just have lockstep property to denote lockstep mode in RPU and otherwis=
e be split, for simplicity?
> > [Wendy] The TCMs are presented differently in the system depending on
> > if RPU is in
> > lockstep or split mode.
> >
> > Not sure if it is allowed to list TCMs registers properties for both
> > split mode and lockstep
> > mode in the same device node.
> >
> > Even though, driver can have this information in the code, but I feel
> > the device tree is a
> > better place for this information.
> > And also for predefined shared memories, you will need to know the RPU
> > op mode ahead,
> > so that you can specify which shared memories belong to which RPU.
> >
> > To dynamic setup the RPU mode, besides sysfs, setup, if remoteproc can
> > support
> > device tree overlay, the RPUs can be described with dtbo and loaded at
> > runtime.
> >
> > Just want to understand the case which needs to set  RPU mode at runtim=
e?
> > I think testing can be one case.
> >
> [Ben Levinsky] for testing, so far it has been r50/1 split and r5 lockste=
p
> > Best Regards,
> > Wendy
> >
> > > - How will someone know to configure the RPU mode and TCM mode via
> > sysfs?
> > > - What happens when someone changes the RPU mode after remoteproc
> > has
> > >   already booted some firmware on it?
> > > - What if the kernel is the one booting the R5, not the user?
> > >
> > > Split vs. lockstep, IMO, needs to be specified as part of the device
> > > tree, and this driver needs to handle configuring the RPU mode and TC=
M
> > > modes appropriately.
> > >
> [Ben Levinsky] Ok, as Wendy suggested would instead the presence of a "lo=
ckstep=3Dmode" property indicate lockstep mode and otherwise imply split mo=
de?
> > > Split vs. lockstep already necessitates different entries in the devi=
ce
> > > tree:
> > > - In the binding, each core references its TCMs via the
> > >   meta-memory-regions phandles, and the referenced nodes necessarily
> > >   encode this size. In split mode, each core has access to 64K of
> > >   TCMA/TCMB, while in lockstep R5 0 has access to 128K of TCMA/TCMB. =
So,
> > >   the "xlnx,tcm" nodes' reg entries need to differ between lockstep a=
nd
> > >   split.
> > > - In lockstep mode, it does not make sense to have both r5@0 and r5@1
> > >   child nodes: only r5@0 makes sense. Though, I just realized that I
> > >   think this driver will currently permit that, and register two
> > >   remoteprocs even in lockstep mode... What happens if someone tries =
to
> > >   load firmware on to r5_1 when they're in lockstep mode? This should
> > >   probably be prevented.
> > >
> [Ben Levinsky] Good Point. the loading of R5 1 while in lockstep is an un=
covered corner case.. for this, before loading/starting or requesting memor=
y the state of global rpu mode can be checked and this can act as a guard f=
or probing a remoteproc instance for r5-1 if either is in lockstep and simi=
lar safeguard for firmware loading for R5-1 if in lockstep mode
[Wendy] As op mode is described in the device tree, in lockstep mode,
r5-1 doesn't need to show in the sysfs.

Thanks,
Wendy

>
> That is, add the lockstep property only if in lockstep mode and use the p=
resence of it or lack thereof for subsequent, single R5-specific driver rem=
oteproc R5 probes or firmware loading
>
> In addition to the above property and its behavior, would correcting the =
inconsistencies of the Documentation vs the split/lockstep code in the remo=
teproc r5 device tree binding, its corresponding remoteproc r5 driver addre=
ss the above concerns as well as the memory handling as you noted earlier?
>
> Also in the next series I can point to a sample R5 application and device=
 trees for the split mode and lockstep cases I used for testing in the cove=
r letter.
>
> > > Thanks,
> > >  Michael
