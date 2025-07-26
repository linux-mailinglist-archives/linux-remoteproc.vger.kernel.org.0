Return-Path: <linux-remoteproc+bounces-4304-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F3B12AEB
	for <lists+linux-remoteproc@lfdr.de>; Sat, 26 Jul 2025 16:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BAD5168269
	for <lists+linux-remoteproc@lfdr.de>; Sat, 26 Jul 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B217261D;
	Sat, 26 Jul 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lhYipf1p"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EC2F2E;
	Sat, 26 Jul 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753539473; cv=none; b=oJJVpPIDexx1agwm5G130NYI8skx/8m2TD8CNZoaQGWhhnu/8S/Avn7ViyTQQ5AjKvHz+oFqjSPbSMZc+7D4h/JWw1ecwpaXevgHMgKE2Hqns3HVvPPJRpyhEAXC5CjNoZRurkSPebXGkb4XpkcgU8hm1mWSoLlUEcBcIJqLDLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753539473; c=relaxed/simple;
	bh=8KkwvnzCcJiTpghpODfnFM+UrNAZ3p5be/ERBqjaXp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SnrCqkOVT7guyRTw+spUyKuHkTnFayo1v6OHRaE1JbC26lPGsbaNUKIPkMLRKTfdzRzWYnMiPu5CHursvgqFiri+yczqC/15GQU4Kg9sD6V209WrkENjuUihAmCIAsuoYTWk5p5hbRBf+T56ZrRXPafOGChSH5smhJz21ADMyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lhYipf1p; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56QEHcaQ1930544;
	Sat, 26 Jul 2025 09:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753539458;
	bh=G+skn5SGSxb7DB2M3P+SqQuYaKBSOOtBDu6nXFnMp2k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lhYipf1pdDlhh9O6kMG/IyGsPtVeoqzXOYdrH/wveNUOZSVN7R3KNNsUyFF63xm5q
	 Wks8fPor36GK4O5WF+/ho48yQqJ+EpKjGxt3tcXuGouzpPvdWs6Zv3cq29qzB83PYN
	 7QXLE1n6K2br7h0M54NOEwK3KRf5Wh4DqfoLYi0E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56QEHcOj759410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 26 Jul 2025 09:17:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 26
 Jul 2025 09:17:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 26 Jul 2025 09:17:38 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56QEHZXj3248421;
	Sat, 26 Jul 2025 09:17:35 -0500
Message-ID: <616fbb7a-8d04-48aa-b3cb-9a1a69c7b92c@ti.com>
Date: Sat, 26 Jul 2025 19:47:34 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
To: Andrew Davis <afd@ti.com>, Hiago De Franco <hiagofranco@gmail.com>,
        <linux-remoteproc@vger.kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>, <linux-kernel@vger.kernel.org>,
        Hiago De Franco <hiago.franco@toradex.com>
References: <20250725150713.barg5lhqr4reoxv3@hiagonb>
 <06186d01-23e7-4fd6-b5c0-b6c1f8ae7fb7@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <06186d01-23e7-4fd6-b5c0-b6c1f8ae7fb7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 7/26/2025 12:59 AM, Andrew Davis wrote:
> On 7/25/25 10:07 AM, Hiago De Franco wrote:
>> Hello everyone,
>>
>> I noticed something that I am trying to debug, maybe you have any idea
>> or tips to help me debugging this issue.
>>
>> On AM62 and AM62P SoCs that I tested, when the remote proc driver is
>> probed, suspend to RAM mode does not work anymore. Without the
>> remote proc driver enabled, everything works just fine.
>>
>> See the driver being probed with AM62 and Cortex M4:
>>
>> root@verdin-am62-15479173:~# dmesg | grep -i -E 
>> "remoteproc|rproc|omap-mailbox"
>> [   10.321304] omap-mailbox 29000000.mailbox: omap mailbox rev 
>> 0x66fc9100
>> [   10.518369] k3-m4-rproc 5000000.m4fss: assigned reserved memory 
>> node m4f-dma-memory@9cb00000
>> [   10.560055] k3-m4-rproc 5000000.m4fss: configured M4F for 
>> remoteproc mode
>> [   10.600283] remoteproc remoteproc0: 5000000.m4fss is available
>> [   10.615269] remoteproc remoteproc0: Direct firmware load for 
>> am62-mcu-m4f0_0-fw failed with error -2
>> [   10.650058] remoteproc remoteproc0: powering up 5000000.m4fss
>> [   10.677073] remoteproc remoteproc0: Direct firmware load for 
>> am62-mcu-m4f0_0-fw failed with error -2
>> [   10.696173] remoteproc remoteproc0: request_firmware failed: -2
>> [   11.953278] remoteproc remoteproc1: 30074000.pru is available
>> [   11.985475] remoteproc remoteproc2: 30078000.pru is available
>>
>> And then when trying to to go into suspend:
>>
>> root@verdin-am62-15479173:~# echo mem > /sys/power/state
>> [   41.727649] PM: suspend entry (deep)
>> [   41.738557] Filesystems sync: 0.006 seconds
>> [   41.751535] Freezing user space processes
>> [   41.758692] Freezing user space processes completed (elapsed 0.002 
>> seconds)
>> [   41.765763] OOM killer disabled.
>> [   41.768999] Freezing remaining freezable tasks
>> [   41.774858] Freezing remaining freezable tasks completed (elapsed 
>> 0.001 seconds)
>> [   41.782333] printk: Suspending console(s) (use no_console_suspend 
>> to debug)
>> [   41.830945] omap-mailbox 29000000.mailbox: fifo 1 has unexpected 
>> unread messages
>> [   41.830980] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): 
>> platform_pm_suspend returns -16
>> [   41.831013] omap-mailbox 29000000.mailbox: PM: failed to suspend: 
>> error -16
>> [   41.831040] PM: Some devices failed to suspend, or early wake 
>> event detected
>> [   41.851206] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
>> [   41.861919] am65-cpsw-nuss 8000000.ethernet end0: PHY 
>> [8000f00.mdio:00] driver [TI DP83867] (irq=354)
>> [   41.862921] am65-cpsw-nuss 8000000.ethernet end0: configuring for 
>> phy/rgmii-rxid link mode
>> [   41.868493] usb-conn-gpio connector: repeated role: device
>> [   42.012894] OOM killer enabled.
>> [   42.016050] Restarting tasks: Starting
>> [   42.024121] Restarting tasks: Done
>> [   42.033660] random: crng reseeded on system resumption
>> [   42.040482] PM: suspend exit
>>
>> I believe the issue happens at this line:
>>
>> [   41.830945] omap-mailbox 29000000.mailbox: fifo 1 has unexpected 
>> unread messages
>>
>> When the remoteproc driver is probed, the omap-mailbox drivers sends a
>> message to Cortex-M4 which is not consumed. Please notice in this case
>> there is no firmware running on M4, the driver is only set to "okay"
>> into the DTB.
>>
>> See the debug message with the message being sent ("hfranco"):
>>
>> root@verdin-am62-15479173:~# dmesg | grep -i -E 
>> "remoteproc|rproc|omap-mailbox|hfranco"
>> [   10.321304] omap-mailbox 29000000.mailbox: omap mailbox rev 
>> 0x66fc9100
>> [   10.518369] k3-m4-rproc 5000000.m4fss: assigned reserved memory 
>> node m4f-dma-memory@9cb00000
>> [   10.560055] k3-m4-rproc 5000000.m4fss: configured M4F for 
>> remoteproc mode
>> [   10.577664] hfranco: sending msg 0xffffff03, name mbox-m4-0
>> [   10.600283] remoteproc remoteproc0: 5000000.m4fss is available
>> [   10.615269] remoteproc remoteproc0: Direct firmware load for 
>> am62-mcu-m4f0_0-fw failed with error -2
>> [   10.650058] remoteproc remoteproc0: powering up 5000000.m4fss
>> [   10.677073] remoteproc remoteproc0: Direct firmware load for 
>> am62-mcu-m4f0_0-fw failed with error -2
>> [   10.696173] remoteproc remoteproc0: request_firmware failed: -2
>> [   11.953278] remoteproc remoteproc1: 30074000.pru is available
>> [   11.985475] remoteproc remoteproc2: 30078000.pru is available
>>
>> AFAIK, the message in sent when 'send_data' callback is called inside
>> mailbox.c, which triggers omap_mbox_chan_send_data() from
>> omap-mailbox.c. If I skip this message, suspend to RAM works again, as
>> the mailbox will be empty.
>>
>> Do you know why this message needs to be sent? Is there a way we can
>> overcome this issue? Commit 9f0cee984a25 ("mailbox/omap: check for any
>> unread messages during suspend") introduced this check.
>>
>
> So the issue then looks to be this message we send here when we setup
> the mailbox[0]. This mailbox setup is done during probe() for the K3
> rproc drivers now (mailbox setup used to be done during
> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
> is correct, but we should have factored out the test message sending
> code out of mailbox setup so it could have been left in
> rproc_{start,attach}(). 


Or, how about we don't send that test mbox message at all. It does not 
actually check if the remoteproc was able to receive and respond to the 
message. It only verifies if the write to the mbox queue was successful. 
And most firmwares anyways don't reply to that mailbox-level echo message.

Thanks,
Beleswar

> That way we only send this message if the
> core is going to be started, no sense in sending that message if
> we are not even going to run the core..
>
> Fix might be as simple as [2] (not tested, if this works feel free
> to send as a fix)
>
> Andrew
>
> [0] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
> [2]
>
> diff --git a/drivers/remoteproc/ti_k3_common.c 
> b/drivers/remoteproc/ti_k3_common.c
> index a70d4879a8bea..657a200fa9040 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_reset);
>
> +static int k3_rproc_ping(struct k3_rproc *kproc)
> +{
> +       /*
> +        * Ping the remote processor, this is only for sanity-sake for 
> now;
> +        * there is no functional effect whatsoever.
> +        *
> +        * Note that the reply will _not_ arrive immediately: this 
> message
> +        * will wait in the mailbox fifo until the remote processor is 
> booted.
> +        */
> +       int ret = mbox_send_message(kproc->mbox, (void 
> *)RP_MBOX_ECHO_REQUEST);
> +       if (ret < 0)
> +               dev_err(kproc->dev, "mbox_send_message failed 
> (%pe)\n", ERR_PTR(ret));
> +
> +       return ret;
> +}
> +
>  /* Release the remote processor from reset */
>  int k3_rproc_release(struct k3_rproc *kproc)
>  {
> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>         if (ret)
>                 dev_err(dev, "module-reset deassert failed (%pe)\n", 
> ERR_PTR(ret));
>
> +       k3_rproc_ping(kproc);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_release);
> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>                 return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>                                      "mbox_request_channel failed\n");
>
> -       /*
> -        * Ping the remote processor, this is only for sanity-sake for 
> now;
> -        * there is no functional effect whatsoever.
> -        *
> -        * Note that the reply will _not_ arrive immediately: this 
> message
> -        * will wait in the mailbox fifo until the remote processor is 
> booted.
> -        */
> -       ret = mbox_send_message(kproc->mbox, (void 
> *)RP_MBOX_ECHO_REQUEST);
> -       if (ret < 0) {
> -               dev_err(dev, "mbox_send_message failed (%pe)\n", 
> ERR_PTR(ret));
> -               mbox_free_channel(kproc->mbox);
> -               return ret;
> -       }
> -
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>   * remote core. This callback is invoked only in IPC-only mode and 
> exists
>   * because rproc_validate() checks for its existence.
>   */
> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
> +int k3_rproc_attach(struct rproc *rproc)
> +{
> +       k3_rproc_ping(rproc->priv);
> +
> +       return 0;
> +}
>  EXPORT_SYMBOL_GPL(k3_rproc_attach);
>
>  /*
>

