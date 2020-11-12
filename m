Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7F12B0464
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Nov 2020 12:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgKLLx3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Nov 2020 06:53:29 -0500
Received: from mga11.intel.com ([192.55.52.93]:65179 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728133AbgKLLv4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 06:51:56 -0500
IronPort-SDR: 4EYkNVofOyJJKF02EN9vyzRxapmp12N1WimQLHwFSh91llpQmbnAe8XTRfD0m3yojcav5ZOesn
 lBSoE7n5Y1PQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166788785"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="166788785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 03:51:44 -0800
IronPort-SDR: /vU2rHEoxoV7EqAioiSlMQfq4xCO9ZUhp9H4k3KzlGn6AAz6TchZgU0MHNm53BExmd6R5WlTMm
 QwnGDD5Nr1QQ==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542233270"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.34.248])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 03:51:42 -0800
Date:   Thu, 12 Nov 2020 12:51:16 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201112115115.GA11069@ubuntu>
References: <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
 <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
 <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Thu, Nov 12, 2020 at 11:17:54AM +0100, Arnaud POULIQUEN wrote:
> Hi Guennadi,
> 
> On 11/11/20 3:49 PM, Guennadi Liakhovetski wrote:
> > Hi Arnaud,

[snip]

> > From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > Subject: [PATCH] fixup! rpmsg: Turn name service into a stand alone driver
> > 
> > Link ns.c with core.c together to guarantee immediate probing.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >  drivers/rpmsg/Makefile                        |  2 +-
> >  drivers/rpmsg/{rpmsg_core.c => core.c}        | 13 +++--
> >  drivers/rpmsg/{rpmsg_ns.c => ns.c}            | 49 ++++++++++++++-----
> >  drivers/rpmsg/virtio_rpmsg_bus.c              |  5 +-
> >  include/linux/rpmsg.h                         |  4 +-
> >  .../{rpmsg_byteorder.h => rpmsg/byteorder.h}  |  0
> >  include/linux/{rpmsg_ns.h => rpmsg/ns.h}      | 16 +++---
> >  7 files changed, 61 insertions(+), 28 deletions(-)
> >  rename drivers/rpmsg/{rpmsg_core.c => core.c} (99%)
> >  rename drivers/rpmsg/{rpmsg_ns.c => ns.c} (76%)
> >  rename include/linux/{rpmsg_byteorder.h => rpmsg/byteorder.h} (100%)
> >  rename include/linux/{rpmsg_ns.h => rpmsg/ns.h} (82%)
> > 
> > diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> > index 8d452656f0ee..5aa79e167372 100644
> > --- a/drivers/rpmsg/Makefile
> > +++ b/drivers/rpmsg/Makefile
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +rpmsg_core-objs			:= core.o ns.o
> >  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
> >  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> > -obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
> >  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
> >  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
> >  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
> > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/core.c
> > similarity index 99%
> > rename from drivers/rpmsg/rpmsg_core.c
> > rename to drivers/rpmsg/core.c
> > index 6381c1e00741..0c622cced804 100644
> > --- a/drivers/rpmsg/rpmsg_core.c
> > +++ b/drivers/rpmsg/core.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/rpmsg.h>
> > +#include <linux/rpmsg/ns.h>
> >  #include <linux/of_device.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/slab.h>
> > @@ -625,21 +626,27 @@ void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
> >  }
> >  EXPORT_SYMBOL(unregister_rpmsg_driver);
> >  
> > -
> >  static int __init rpmsg_init(void)
> >  {
> >  	int ret;
> >  
> >  	ret = bus_register(&rpmsg_bus);
> > -	if (ret)
> > +	if (ret) {
> >  		pr_err("failed to register rpmsg bus: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = rpmsg_ns_init();
> > +	if (ret)
> > +		bus_unregister(&rpmsg_bus);
> >  
> >  	return ret;
> >  }
> >  postcore_initcall(rpmsg_init);
> >  
> > -static void __exit rpmsg_fini(void)
> > +static void rpmsg_fini(void)
> >  {
> > +	rpmsg_ns_exit();
> >  	bus_unregister(&rpmsg_bus);
> >  }
> >  module_exit(rpmsg_fini);
> 
> The drawback of this solution is that it makes the anoucement service ns
> mandatory, but it is optional because it depends on the RPMsg backend bus.
> RPMsg NS should be generic but optional.
> What about calling this in rpmsg_virtio?

This just registers a driver. If the backend doesn't register a suitable 
device by calling rpmsg_ns_register_device(); nothing happens. But if 
you're concerned about wasted memory, we can make it conditional on a 
configuration option.

> > diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/ns.c
> > similarity index 76%
> > rename from drivers/rpmsg/rpmsg_ns.c
> > rename to drivers/rpmsg/ns.c
> > index 8e26824ca328..86c011bfb62f 100644
> > --- a/drivers/rpmsg/rpmsg_ns.c
> > +++ b/drivers/rpmsg/ns.c
> > @@ -2,15 +2,47 @@
> >  /*
> >   * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> >   */
> > +#include <linux/completion.h>
> >  #include <linux/device.h>
> > +#include <linux/export.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > -#include <linux/slab.h>
> >  #include <linux/rpmsg.h>
> > -#include <linux/rpmsg_ns.h>
> > +#include <linux/rpmsg/ns.h>
> > +#include <linux/slab.h>
> >  
> >  #include "rpmsg_internal.h"
> >  
> > +int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> > +{
> > +	int ret;
> > +
> > +	strcpy(rpdev->id.name, "rpmsg_ns");
> > +	rpdev->driver_override = "rpmsg_ns";
> > +	rpdev->src = RPMSG_NS_ADDR;
> > +	rpdev->dst = RPMSG_NS_ADDR;
> > +
> > +	ret = rpmsg_register_device(rpdev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (!wait_for_completion_timeout(&rpdev->ns_ready,
> > +					 msecs_to_jiffies(1))) {
> 
> Does this work if called in rproc_virtio_probe? i tried a similar implementation
> but it always falls in timeout because rpmsg_ns_probe never called, probably due
> to the serial probing.The rpmsg_ns probe always occurs after the end of the
> virtio probe.

It works, yes. As you see, rpmsg_register_device() is called first, that can 
already result in the .probe() being called and the completion being signalled
before we actually start a wait on it. That works well. BTW, the version here is 
missing a call to

+	init_completion(&rpdev->ns_ready);

right above the call to rpmsg_register_device(). But yes, it works.

> For me the wait completion can not be called during the virtio probe. That's why
> i implemented it in rpmsg_recv_done to ensure that the service is available
> before first message treatment.

Why can it not be called in rpmsg_ns_probe()? The only purpose of this completion 
is to make sure that rpmsg_create_ept() for the NS endpoint has completed before 
we begin communicating with the remote / host, e.g. by calling 
virtio_device_ready() in case of the VirtIO backend, right?

Thanks
Guennadi

> Thanks,
> Arnaud
> 
> > +		struct rpmsg_channel_info info = {
> > +			.name = "rpmsg_ns",
> > +			.src = rpdev->src,
> > +			.dst = rpdev->dst,
> > +		};
> > +
> > +		rpmsg_unregister_device(rpdev->dev.parent, &info);
> > +
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(rpmsg_ns_register_device);
> > +
> >  /* invoked when a name service announcement arrives */
> >  static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> >  		       void *priv, u32 src)
> > @@ -76,6 +108,8 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
> >  	}
> >  	rpdev->ept = ns_ept;
> >  
> > +	complete(&rpdev->ns_ready);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -84,7 +118,7 @@ static struct rpmsg_driver rpmsg_ns_driver = {
> >  	.probe = rpmsg_ns_probe,
> >  };
> >  
> > -static int rpmsg_ns_init(void)
> > +int rpmsg_ns_init(void)
> >  {
> >  	int ret;
> >  
> > @@ -94,15 +128,8 @@ static int rpmsg_ns_init(void)
> >  
> >  	return ret;
> >  }
> > -postcore_initcall(rpmsg_ns_init);
> >  
> > -static void rpmsg_ns_exit(void)
> > +void rpmsg_ns_exit(void)
> >  {
> >  	unregister_rpmsg_driver(&rpmsg_ns_driver);
> >  }
> > -module_exit(rpmsg_ns_exit);
> > -
> > -MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
> > -MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> > -MODULE_ALIAS("rpmsg_ns");
> > -MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 10a16be986fc..fdf00cc5f57f 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -19,8 +19,8 @@
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> >  #include <linux/rpmsg.h>
> > -#include <linux/rpmsg_byteorder.h>
> > -#include <linux/rpmsg_ns.h>
> > +#include <linux/rpmsg/byteorder.h>
> > +#include <linux/rpmsg/ns.h>
> >  #include <linux/rpmsg/virtio.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> > @@ -920,6 +920,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	return 0;
> >  
> >  free_coherent:
> > +	kfree(vch);
> >  	dma_free_coherent(vdev->dev.parent, total_buf_space,
> >  			  bufs_va, vrp->bufs_dma);
> >  vqs_del:
> > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > index 8ee1b1dab657..71fd15ada5c0 100644
> > --- a/include/linux/rpmsg.h
> > +++ b/include/linux/rpmsg.h
> > @@ -10,6 +10,7 @@
> >  #ifndef _LINUX_RPMSG_H
> >  #define _LINUX_RPMSG_H
> >  
> > +#include <linux/completion.h>
> >  #include <linux/types.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> > @@ -17,7 +18,7 @@
> >  #include <linux/kref.h>
> >  #include <linux/mutex.h>
> >  #include <linux/poll.h>
> > -#include <linux/rpmsg_byteorder.h>
> > +#include <linux/rpmsg/byteorder.h>
> >  
> >  #define RPMSG_ADDR_ANY		0xFFFFFFFF
> >  
> > @@ -58,6 +59,7 @@ struct rpmsg_device {
> >  	struct rpmsg_endpoint *ept;
> >  	bool announce;
> >  	bool little_endian;
> > +	struct completion ns_ready;
> >  
> >  	const struct rpmsg_device_ops *ops;
> >  };
> > diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg/byteorder.h
> > similarity index 100%
> > rename from include/linux/rpmsg_byteorder.h
> > rename to include/linux/rpmsg/byteorder.h
> > diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg/ns.h
> > similarity index 82%
> > rename from include/linux/rpmsg_ns.h
> > rename to include/linux/rpmsg/ns.h
> > index 42786bb759b5..2499db0c8c3d 100644
> > --- a/include/linux/rpmsg_ns.h
> > +++ b/include/linux/rpmsg/ns.h
> > @@ -4,8 +4,9 @@
> >  #define _LINUX_RPMSG_NS_H
> >  
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/rpmsg.h>
> > +#include <linux/rpmsg/byteorder.h>
> >  #include <linux/types.h>
> > -#include <linux/rpmsg_byteorder.h>
> >  
> >  /**
> >   * struct rpmsg_ns_msg - dynamic name service announcement message
> > @@ -46,14 +47,9 @@ enum rpmsg_ns_flags {
> >   * This function wraps rpmsg_register_device() preparing the rpdev for use as
> >   * basis for the rpmsg name service device.
> >   */
> > -static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> > -{
> > -       strcpy(rpdev->id.name, "rpmsg_ns");
> > -       rpdev->driver_override = "rpmsg_ns";
> > -       rpdev->src = RPMSG_NS_ADDR;
> > -       rpdev->dst = RPMSG_NS_ADDR;
> > -
> > -       return rpmsg_register_device(rpdev);
> > -}
> > +int rpmsg_ns_register_device(struct rpmsg_device *rpdev);
> > +
> > +int rpmsg_ns_init(void);
> > +void rpmsg_ns_exit(void);
> >  
> >  #endif
> > 
