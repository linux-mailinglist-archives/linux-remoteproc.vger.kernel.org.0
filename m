Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7214E251D9E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Aug 2020 18:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgHYQyj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 25 Aug 2020 12:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgHYQyh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Aug 2020 12:54:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1268AC061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2020 09:54:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nv17so1559995pjb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2020 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1uUGHRQN2BNT90A+zQOT/kUuzEqMrYwsSYbjLjzbfgs=;
        b=SOayGaYxKnzRE4LpSqIAhWOdUqc2TKiaqaFkCXPiGs+HLMze4aZKMD9Kzn2c9OgBJo
         By3/JxaT07ZKOfD+KcYX6FFl301+DXf3ok6B89wJy1SNz6g+vw2KUWPA9hR1472WAYBA
         sgW26Jeo8UmydFzR4GjIx3/I03KTE6iZxO1+G4NFQbitfhVIYbVOoBRCKDZsWocCbEGl
         cXHXtvjrP0HmcDX3hH6iI9az8f4M2pEVDBcFeK7p4NWbWJjcoLqgaq9aZLXjpGEuPenH
         O6AROmGrzkiFTs8hBBps85azTcyFqV1udyiDHgm3tlQDc5MvhArnotcu56NCJd0b9aXQ
         f+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1uUGHRQN2BNT90A+zQOT/kUuzEqMrYwsSYbjLjzbfgs=;
        b=Qep+eLt/JHORuODmsrVWrSUGHEQcCV2HJkUHJ8EY66eXdPe8XBM/Zp+8cHvXVUxQox
         z/Aqn61lTy1u/xbydVYGPKoQ4Js8gBL6BKM54j2Zu+xcgTDhkWQD5L57RmzQLp2U0JxD
         s/nRUYxBhZDBzby4cY9vd5gvsEt/9ResjjmjMeKovz9/NH29Z0s+gmPu6qi90NCbegnV
         3JOmpPhiOW7ZZThObD1SU+0CNve80rcHPdbeRYhxrPjRdMyAjbVDht4oj0yRLCqQsXgU
         fpVRbHp2SlZoJyqDnoshZx3taO/2H0jZM+FBKaoKVKhGB9p4Keb+MYxLaO4ATNq2k3Os
         CACg==
X-Gm-Message-State: AOAM533dcyRPaxMqeVPnYu3K10VFiVS1sUVebaJh4Ydfr2+odqgG59M4
        tHtNMEsQAs+VCwEvVdV9oRE97w==
X-Google-Smtp-Source: ABdhPJwX5wyWCnBdCOij97TY1aGnnf5ZJp8ypLSb3YbOIlBgcEnJ6+2om5/j0FBw50E9YeihheQRdw==
X-Received: by 2002:a17:90b:3113:: with SMTP id gc19mr2362339pjb.46.1598374476417;
        Tue, 25 Aug 2020 09:54:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z15sm13724198pgz.13.2020.08.25.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 09:54:35 -0700 (PDT)
Date:   Tue, 25 Aug 2020 10:54:33 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 8/9] rpmsg: virtio: use rpmsg_ns driver to manage ns
 announcement
Message-ID: <20200825165433.GA4141387@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-9-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-9-arnaud.pouliquen@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Fri, Jul 31, 2020 at 01:47:31PM +0200, Arnaud Pouliquen wrote:
> Use the new rpmsg_ns API to send the name service announcements if
> the VIRTIO_RPMSG_F_NS is set, else just not implement the ops.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 94 +++++---------------------------
>  1 file changed, 13 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index f771fdae150e..3c771a6392be 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -91,35 +91,6 @@ struct rpmsg_hdr {
>  	u8 data[];
>  } __packed;
>  
> -/**
> - * struct rpmsg_ns_msg - dynamic name service announcement message
> - * @name: name of remote service that is published
> - * @addr: address of remote service that is published
> - * @flags: indicates whether service is created or destroyed
> - *
> - * This message is sent across to publish a new service, or announce
> - * about its removal. When we receive these messages, an appropriate
> - * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> - * or ->remove() handler of the appropriate rpmsg driver will be invoked
> - * (if/as-soon-as one is registered).
> - */
> -struct rpmsg_ns_msg {
> -	char name[RPMSG_NAME_SIZE];
> -	__virtio32 addr;
> -	__virtio32 flags;
> -} __packed;
> -
> -/**
> - * enum rpmsg_ns_flags - dynamic name service announcement flags
> - *
> - * @RPMSG_NS_CREATE: a new remote service was just created
> - * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> - */
> -enum rpmsg_ns_flags {
> -	RPMSG_NS_CREATE		= 0,
> -	RPMSG_NS_DESTROY	= 1,
> -};
> -
>  /**
>   * @vrp: the remote processor this channel belongs to
>   */
> @@ -324,60 +295,18 @@ static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>  	__rpmsg_destroy_ept(vch->vrp, ept);
>  }
>  
> -static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
> -{
> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> -	struct virtproc_info *vrp = vch->vrp;
> -	struct device *dev = &rpdev->dev;
> -	int err = 0;
> -
> -	/* need to tell remote processor's name service about this channel ? */
> -	if (rpdev->announce && rpdev->ept &&
> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> -		struct rpmsg_ns_msg nsm;
> -
> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> -
> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> -		if (err)
> -			dev_err(dev, "failed to announce service %d\n", err);
> -	}
> -
> -	return err;
> -}
> -
> -static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> -{
> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> -	struct virtproc_info *vrp = vch->vrp;
> -	struct device *dev = &rpdev->dev;
> -	int err = 0;
> -
> -	/* tell remote processor's name service we're removing this channel */
> -	if (rpdev->announce && rpdev->ept &&
> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> -		struct rpmsg_ns_msg nsm;
> -
> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> -
> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> -		if (err)
> -			dev_err(dev, "failed to announce service %d\n", err);
> -	}
> -
> -	return err;
> -}
> -
>  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
>  	.create_channel = virtio_rpmsg_create_channel,
>  	.release_channel = virtio_rpmsg_release_channel,
>  	.create_ept = virtio_rpmsg_create_ept,
> -	.announce_create = virtio_rpmsg_announce_create,
> -	.announce_destroy = virtio_rpmsg_announce_destroy,
> +};
> +
> +static const struct rpmsg_device_ops virtio_rpmsg_w_nsa_ops = {
> +	.create_channel = virtio_rpmsg_create_channel,
> +	.release_channel = virtio_rpmsg_release_channel,
> +	.create_ept = virtio_rpmsg_create_ept,
> +	.announce_create = rpmsg_ns_announce_create,
> +	.announce_destroy = rpmsg_ns_announce_destroy,
>  };
>  
>  static void virtio_rpmsg_release_device(struct device *dev)
> @@ -423,7 +352,10 @@ __rpmsg_create_channel(struct virtproc_info *vrp,
>  	rpdev = &vch->rpdev;
>  	rpdev->src = chinfo->src;
>  	rpdev->dst = chinfo->dst;
> -	rpdev->ops = &virtio_rpmsg_ops;
> +	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS))
> +		rpdev->ops = &virtio_rpmsg_w_nsa_ops;
> +	else
> +		rpdev->ops = &virtio_rpmsg_ops;

Yesterday I struggled with this part and I still do this morning.  Function
__rpmsg_create_channel() can only be called if VIRTIO_RPMSG_F_NS is set so there
is no need to check it again.  I would also have expected this patch to be a
simple replace of the .announce_create/destroy functions.  Adding an ops that
doesn't have the .announce_create/destroy functions looks like a feature to me,
and one that I don't quite get.

Do you think you could expand on the motivation behind this patch?

Thanks,
Mathieu 

>  
>  	/*
>  	 * rpmsg server channels has predefined local address (for now),
> @@ -933,7 +865,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  		/* Assign public information to the rpmsg_device */
>  		rpdev_ns = &vch->rpdev;
> -		rpdev_ns->ops = &virtio_rpmsg_ops;
> +		rpdev_ns->ops = &virtio_rpmsg_w_nsa_ops;
>  
>  		rpdev_ns->dev.parent = &vrp->vdev->dev;
>  		rpdev_ns->dev.release = virtio_rpmsg_release_device;
> -- 
> 2.17.1
> 
