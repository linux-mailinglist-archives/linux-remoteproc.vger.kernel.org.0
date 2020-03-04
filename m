Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE78A17949C
	for <lists+linux-remoteproc@lfdr.de>; Wed,  4 Mar 2020 17:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgCDQLW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 4 Mar 2020 11:11:22 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40582 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgCDQLV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Mar 2020 11:11:21 -0500
Received: by mail-io1-f66.google.com with SMTP id m22so2998534ioj.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2020 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9gxhJJFks7awu0GAHUqwRu3fq3/omYQJNYXC+JPuIXc=;
        b=afIVYF9rl/H7czGESWbokH+h25dzpCew1ja/2H9Lp0gGHBPA4i6iwmpEoh0HBtsgAH
         Qn/JoY8ld63fl4oW2I/H8fuo6Tzo5SEoTHMl3AM/78w8Dlo0D+Z2QGfnyalIZkRvaoR8
         DQXwjLFnLewA4m7hFdos+gmCm5hZbJsqTMQhBtZy0SmtCfg66+GJg+F97zKYA9P3imtn
         NiD1ifizbBJaqqA2LWMs0GKs2t1aCKmZDRN8qtfvknymagTWFAWnNOwwGUXUCzq7rHGF
         QqIDJvWDTXplnE/1qz9YZWxmqMIucfemhhAwfFCEaQ/v62A1rQURtq48lR+cbZ8lCMzi
         Rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9gxhJJFks7awu0GAHUqwRu3fq3/omYQJNYXC+JPuIXc=;
        b=J0gQ+yG9kluL029HS5V+Dn7LWIlmS78a2v5uGPGgeZ8u4GZ8aWr9KxPOG4ovajQTCx
         IVPDCGdQN6j8YWnVOyAESvA22ZPOuTDfTBOIJsEBBagcUUU9p9pkRjLOwYJZELv6uY3A
         VcraM0PTeB3NbjOHiy/PIUwlEGlDrS9aO+KkgKr3wwKwhBfSJYuLimpub90p/pNnkffe
         tO6LVYb6j4OZFEoRBfuubgyuIoO968lNGWn8jHp4r6ofYN8UzDS5qvpC4UqSJfkaLa4K
         LPBKgrDh9Pm62FTnsKyuWMevLukI9bBqcfkMFmN//nDTGemqVrnoH6TeO/rF45dQU+7j
         IPsQ==
X-Gm-Message-State: ANhLgQ1VjU9UUoi/zh4k8ubFqbjiENtbmlBSsUZBjR13L/I4ezx2qQnm
        hLuyzVLaIDcUu5cdTQic1Wr6mNjDxvfgrtpnTUJCCg==
X-Google-Smtp-Source: ADFU+vvq8wti01cogm+PQgKrcoe8uIDZODyDO1ta7HVTFqnSbKGRd5KHnPfAbJRBk9Rn6yVkW6+PrpLTf7sZyylTtgw=
X-Received: by 2002:a05:6638:44a:: with SMTP id r10mr3282006jap.36.1583338279234;
 Wed, 04 Mar 2020 08:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
 <CANLsYkyDsJaxO_37qTjEP+aeQju8W2+jhHFRF7+oifBMqJqyng@mail.gmail.com>
 <20200302214317.GI210720@yoga> <CANLsYkwBxNecM4M2Ld_HFecOiQJ=S0FFWQY1KJTwY3VGLyr_FA@mail.gmail.com>
 <22609481583330996@myt3-cba274279eae.qloud-c.yandex.net>
In-Reply-To: <22609481583330996@myt3-cba274279eae.qloud-c.yandex.net>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 4 Mar 2020 09:11:08 -0700
Message-ID: <CANLsYkwNzqj3Z7VKP4eVbfTZWqpc+2rQmrBcDXpcUEo3M=n9Ww@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: error on kick missing
To:     nikita.shubin@maquefel.me
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nikita Shubin <nshubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 4 Mar 2020 at 07:09, <nikita.shubin@maquefel.me> wrote:
>
> 03.03.2020, 18:56, "Mathieu Poirier" <mathieu.poirier@linaro.org>:
> > On Mon, 2 Mar 2020 at 14:43, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >>  On Mon 02 Mar 09:44 PST 2020, Mathieu Poirier wrote:
> >>
> >>  > Hi Nikita,
> >>  >
> >>  > On Fri, 28 Feb 2020 at 04:07, <nikita.shubin@maquefel.me> wrote:
> >>  > >
> >>  > > From: Nikita Shubin <NShubin@topcon.com>
> >>  > >
> >>  > > .kick method not set in rproc_ops will result in:
> >>  > >
> >>  > > 8<--- cut here ---
> >>  > > Unable to handle kernel NULL pointer dereference
> >>  > >
> >>  > > in rproc_virtio_notify, after firmware loading.
> >>  >
> >>  > There wasn't any kernel stack trace? What platform was this observed
> >>  > on? I'm afraid we won't be able to move forward with this patch
> >>  > without one, or more information on what is happening.
> >>  >
> >>  > >
> >>  > > refuse to register an rproc-induced virtio device if no kick method was
> >>  > > defined for rproc.
> >>  > >
> >>  > > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> >>  > > ---
> >>
> >>  Nikita, please include "v2" in the subject and add here (below the ---)
> >>  short summary of what changes since v1.
> >>
> >>  > > drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
> >>  > > 1 file changed, 7 insertions(+)
> >>  > >
> >>  > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >>  > > index 8c07cb2ca8ba..31a62a0b470e 100644
> >>  > > --- a/drivers/remoteproc/remoteproc_virtio.c
> >>  > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>  > > @@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >>  > > struct rproc_mem_entry *mem;
> >>  > > int ret;
> >>  > >
> >>  > > + if (rproc->ops->kick == NULL) {
> >>  > > + ret = -EINVAL;
> >>  > > + dev_err(dev, ".kick method not defined for %s",
> >>  > > + rproc->name);
> >>  > > + goto out;
> >>  > > + }
> >>  >
> >>  > I think it would be better to use WARN_ONCE() in rproc_virtio_notify()
> >>  > than prevent a virtio device from being added. But again I will need
> >>  > more information on this case to know for sure.
> >>  >
> >>
> >>  I reviewed v1 and afaict there's no way rproc->ops->kick would change
> >>  and that things wouldn't work without a kick.
> >
>
> Hi Mathieu and Bjorn.
>
> > Yes, a "v2" tag and a little bit of history would have helped.
>
> My bad about "v2" - the email was malformed so i pretended as it never existed.
>
> > We came to the same conclusion - I couldn't see either how things would
> > work without a kick(), especially if an rvdev with virtio queues is
> > used.
>
> This issue can happen with any remoteproc driver in case if:
>
> 1) .kick method wasn't defined in driver
> 2) resource_table exists in firmware and has "Virtio device entry" defined
>
> Observed on imx_rproc driver on imx7d hardware, full stack strace:
>
> [   13.180049][  T415] 8<--- cut here ---
> [   13.190558][  T415] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> [   13.212544][  T415] pgd = (ptrval)
> [   13.217052][  T415] [00000000] *pgd=00000000
> [   13.224692][  T415] Internal error: Oops: 80000005 [#1] PREEMPT SMP ARM
> [   13.231318][  T415] Modules linked in: rpmsg_char imx_rproc virtio_rpmsg_bus rpmsg_core [last unloaded: imx_rproc]
> [   13.241687][  T415] CPU: 0 PID: 415 Comm: unload-load.sh Not tainted 5.5.2-00002-g707df13bbbdd #6
> [   13.250561][  T415] Hardware name: Freescale i.MX7 Dual (Device Tree)
> [   13.257009][  T415] PC is at 0x0
> [   13.260249][  T415] LR is at rproc_virtio_notify+0x2c/0x54
> [   13.265738][  T415] pc : [<00000000>]    lr : [<8050f6b0>]    psr: 60010113
> [   13.272702][  T415] sp : b8d47c48  ip : 00000001  fp : bc04de00
> [   13.278625][  T415] r10: bc04c000  r9 : 00000cc0  r8 : b8d46000
> [   13.284548][  T415] r7 : 00000000  r6 : b898f200  r5 : 00000000  r4 : b8a29800
> [   13.291773][  T415] r3 : 00000000  r2 : 990a3ad4  r1 : 00000000  r0 : b8a29800
> [   13.299000][  T415] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   13.306833][  T415] Control: 10c5387d  Table: b8b4806a  DAC: 00000051
> [   13.313278][  T415] Process unload-load.sh (pid: 415, stack limit = 0x(ptrval))
> [   13.320591][  T415] Stack: (0xb8d47c48 to 0xb8d48000)
> [   13.325651][  T415] 7c40:                   b895b680 00000001 b898f200 803c6430 b895bc80 7f00ae18
> [   13.334531][  T415] 7c60: 00000035 00000000 00000000 b9393200 80b3ed80 00004000 b9393268 bbf5a9a2
> [   13.343410][  T415] 7c80: 00000e00 00000200 00000000 7f00aff0 7f00a014 b895b680 b895b800 990a3ad4
> [   13.352290][  T415] 7ca0: 00000001 b898f210 b898f200 00000000 00000000 7f00e000 00000001 00000000
> [   13.361170][  T415] 7cc0: 00000000 803c62e0 80b2169c 802a0924 b898f210 00000000 00000000 b898f210
> [   13.370049][  T415] 7ce0: 80b9ba44 00000000 80b9ba48 00000000 7f00e000 00000008 80b2169c 80400114
> [   13.378929][  T415] 7d00: 80b2169c 8061fd64 b898f210 7f00e000 80400744 b8d46000 80b21634 80b21634
> [   13.387809][  T415] 7d20: 80b2169c 80400614 80b21634 80400718 7f00e000 00000000 b8d47d7c 80400744
> [   13.396689][  T415] 7d40: b8d46000 80b21634 80b21634 803fe338 b898f254 b80fe76c b8d32e38 990a3ad4
> [   13.405569][  T415] 7d60: fffffff3 b898f210 b8d46000 00000001 b898f254 803ffe7c 80857a90 b898f210
> [   13.414449][  T415] 7d80: 00000001 990a3ad4 b8d46000 b898f210 b898f210 80b17aec b8a29c20 803ff0a4
> [   13.423328][  T415] 7da0: b898f210 00000000 b8d46000 803fb8e0 b898f200 00000000 80b17aec b898f210
> [   13.432209][  T415] 7dc0: b8a29c20 990a3ad4 b895b900 b898f200 8050fb7c 80b17aec b898f210 b8a29c20
> [   13.441088][  T415] 7de0: b8a29800 b895b900 b8a29a04 803c5ec0 b8a29c00 b898f200 b8a29a20 00000007
> [   13.449968][  T415] 7e00: b8a29c20 8050fd78 b8a29800 00000000 b8a29a20 b8a29c04 b8a29820 b8a299d0
> [   13.458848][  T415] 7e20: b895b900 8050e5a4 b8a29800 b8a299d8 b8d46000 b8a299e0 b8a29820 b8a299d0
> [   13.467728][  T415] 7e40: b895b900 8050e008 000041ed 00000000 b8b8c440 b8a299d8 b8a299e0 b8a299d8
> [   13.476608][  T415] 7e60: b8b8c440 990a3ad4 00000000 b8a29820 b8b8c400 00000006 b8a29800 b895b880
> [   13.485487][  T415] 7e80: b8d47f78 00000000 00000000 8050f4b4 00000006 b895b890 b8b8c400 008fbea0
> [   13.494367][  T415] 7ea0: b895b880 8029f530 00000000 00000000 b8d46000 00000006 b8d46000 008fbea0
> [   13.503246][  T415] 7ec0: 8029f434 00000000 b8d46000 00000000 00000000 8021e2e4 0000000a 8061fd0c
> [   13.512125][  T415] 7ee0: 0000000a b8af0c00 0000000a b8af0c40 00000001 b8af0c40 00000000 8061f910
> [   13.521005][  T415] 7f00: 0000000a 80240af4 00000002 b8d46000 00000000 8061fd0c 00000002 80232d7c
> [   13.529884][  T415] 7f20: 00000000 b8d46000 00000000 990a3ad4 00000000 00000006 b8a62d80 008fbea0
> [   13.538764][  T415] 7f40: b8d47f78 00000000 b8d46000 00000000 00000000 802210c0 b88f2900 00000000
> [   13.547644][  T415] 7f60: b8a62d80 b8a62d80 b8d46000 00000006 008fbea0 80221320 00000000 00000000
> [   13.556524][  T415] 7f80: b8af0c00 990a3ad4 0000006c 008fbea0 76f1cda0 00000004 80101204 00000004
> [   13.565403][  T415] 7fa0: 00000000 80101000 0000006c 008fbea0 00000001 008fbea0 00000006 00000000
> [   13.574283][  T415] 7fc0: 0000006c 008fbea0 76f1cda0 00000004 00000006 00000006 00000000 00000000
> [   13.583162][  T415] 7fe0: 00000004 7ebaf7d0 76eb4c0b 76e3f206 600d0030 00000001 00000000 00000000
> [   13.592056][  T415] [<8050f6b0>] (rproc_virtio_notify) from [<803c6430>] (virtqueue_notify+0x1c/0x34)
> [   13.601298][  T415] [<803c6430>] (virtqueue_notify) from [<7f00ae18>] (rpmsg_probe+0x280/0x380 [virtio_rpmsg_bus])
> [   13.611663][  T415] [<7f00ae18>] (rpmsg_probe [virtio_rpmsg_bus]) from [<803c62e0>] (virtio_dev_probe+0x1f8/0x2c4)
> [   13.622022][  T415] [<803c62e0>] (virtio_dev_probe) from [<80400114>] (really_probe+0x200/0x450)
> [   13.630817][  T415] [<80400114>] (really_probe) from [<80400614>] (driver_probe_device+0x16c/0x1ac)
> [   13.639873][  T415] [<80400614>] (driver_probe_device) from [<803fe338>] (bus_for_each_drv+0x84/0xc8)
> [   13.649102][  T415] [<803fe338>] (bus_for_each_drv) from [<803ffe7c>] (__device_attach+0xd4/0x164)
> [   13.658069][  T415] [<803ffe7c>] (__device_attach) from [<803ff0a4>] (bus_probe_device+0x84/0x8c)
> [   13.666950][  T415] [<803ff0a4>] (bus_probe_device) from [<803fb8e0>] (device_add+0x444/0x768)
> [   13.675572][  T415] [<803fb8e0>] (device_add) from [<803c5ec0>] (register_virtio_device+0xa4/0xfc)
> [   13.684541][  T415] [<803c5ec0>] (register_virtio_device) from [<8050fd78>] (rproc_add_virtio_dev+0xcc/0x1b8)
> [   13.694466][  T415] [<8050fd78>] (rproc_add_virtio_dev) from [<8050e5a4>] (rproc_start+0x148/0x200)
> [   13.703521][  T415] [<8050e5a4>] (rproc_start) from [<8050e008>] (rproc_boot+0x384/0x5c0)
> [   13.711708][  T415] [<8050e008>] (rproc_boot) from [<8050f4b4>] (state_store+0x3c/0xc8)
> [   13.719723][  T415] [<8050f4b4>] (state_store) from [<8029f530>] (kernfs_fop_write+0xfc/0x214)
> [   13.728348][  T415] [<8029f530>] (kernfs_fop_write) from [<8021e2e4>] (__vfs_write+0x30/0x1cc)
> [   13.736971][  T415] [<8021e2e4>] (__vfs_write) from [<802210c0>] (vfs_write+0xac/0x17c)
> [   13.744985][  T415] [<802210c0>] (vfs_write) from [<80221320>] (ksys_write+0x64/0xe4)
> [   13.752825][  T415] [<80221320>] (ksys_write) from [<80101000>] (ret_fast_syscall+0x0/0x54)
> [   13.761178][  T415] Exception stack(0xb8d47fa8 to 0xb8d47ff0)
> [   13.766932][  T415] 7fa0:                   0000006c 008fbea0 00000001 008fbea0 00000006 00000000
> [   13.775811][  T415] 7fc0: 0000006c 008fbea0 76f1cda0 00000004 00000006 00000006 00000000 00000000
> [   13.784687][  T415] 7fe0: 00000004 7ebaf7d0 76eb4c0b 76e3f206
> [   13.790442][  T415] Code: bad PC value
> [   13.839214][  T415] ---[ end trace 1fe21ecfc9f28852 ]---

Please send a v3 with the complete stack trace, add a Fixes tag and CC stable.

Thanks,
Mathieu

>
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> >>  So I requested that it should be checked during initialization instead.
> >>  Please let me know if I missed some case.
> >>
> >>  Regards,
> >>  Bjorn
> >>
> >>  > Thanks,
> >>  > Mathieu
> >>  >
> >>  > > +
> >>  > > /* Try to find dedicated vdev buffer carveout */
> >>  > > mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> >>  > > if (mem) {
> >>  > > --
> >>  > > 2.24.1
> >>  > >
