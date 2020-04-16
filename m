Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844951AD031
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Apr 2020 21:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgDPTPX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 15:15:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:60733 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727774AbgDPTPX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 15:15:23 -0400
IronPort-SDR: NegDJEZv2xVjxprnZeN0+YfjbP3rFizC2lg9m+9AJNHO2kadJbMeVcGgAGtYnzA6r+EdB2u51b
 rAUtxLSAH7rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 12:15:21 -0700
IronPort-SDR: FqcATAY3e41SHf0dDM0TTXTSac2aLtmsrAs0BX+5h1whlZsf6GOmi5VSN+XwhZweI70hOm5jU6
 zrNyhDLWTd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; 
   d="scan'208";a="400780618"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.43.195])
  by orsmga004.jf.intel.com with ESMTP; 16 Apr 2020 12:15:18 -0700
Date:   Thu, 16 Apr 2020 21:15:17 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: Re: RPMSG over VirtIO under KVM
Message-ID: <20200416191516.GB25561@ubuntu>
References: <20200416140307.GA25561@ubuntu>
 <CANLsYky6hdPnerfYvZk6SdO2supVPSr7Sa_x4-UsJ6Y5bgTfHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYky6hdPnerfYvZk6SdO2supVPSr7Sa_x4-UsJ6Y5bgTfHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Thu, Apr 16, 2020 at 11:50:48AM -0600, Mathieu Poirier wrote:
> Good day Guennadi,
> 
> On Thu, 16 Apr 2020 at 08:06, Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com> wrote:
> >
> > Hi,
> >
> > It has been proposed to port the VirtIO SOF driver [1], used to
> > implement audio support under Linux, running in a KVM guest, to use
> > RPMSG to communicate with the SOF vhost driver, running on the Linux
> > host. On one hand I see an rpmsg-virtio driver, which should make such
> > a port possible, on the other hand I don't see a single VirtIO driver
> > in the kernel, using RPMSG for Linux virtualisation.
> 
> Above you wrote "rpmsg-virtio" driver, which I take to mean the code
> found in file virtio_rpmsg_bus.c [1].

Exactly.

> The code in [1] centers around
> the communication between an application processor and some form of
> remote processor (micro controller or dsp).  The "virtio" part of the
> name refers to the underlying infrastructure put in place to
> communicate with the remote processor, all coming from the virtio
> space.  Here instead of using the virtio mechanic to communicate
> between a host and a guest, it is used to communicate with a remote
> processor.
> 
> I came to the same conclusion a while back - as of today no virtio
> drivers are using RPMSG to communicate between host and guest.  I
> suppose nobody needed it or implemented their own schemes.
> 
> [1].  https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/rpmsg/virtio_rpmsg_bus.c
> 
> >
> > Hence my questions: is this a good idea? Is there anything in the
> > kernel VirtIO RPMSG implementation, that would make this impossible?
> 
> I don't see why it wouldn't be a good idea, nor what would technically
> prevent such a thing from happening.  Two things work in your favour:
> 1) the RPMSG foundation has been tailored to be used over different
> kinds of hardware and 2) an existing implementation is already using
> virtioqueues.
> 
> I suggest to start looking at function rpmsg_register_device(), used
> by different RPMSG drivers - the magic is really in the RPMSG
> operations (struct rpmsg_device_ops) that are used to abstract the HW
> implementation.

Exactly, just what I was thinking too. And I also think it can well be 
possible to reuse the code in virtio_rpmsg_bus.c, possibly with some 
limited extensions and modifications. I'll get it rolling then.

Thanks
Guennadi

> Regards,
> Mathieu
> 
> > [1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
