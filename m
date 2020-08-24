Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7069250C0C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Aug 2020 01:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgHXXFB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Aug 2020 19:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgHXXFA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Aug 2020 19:05:00 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF80C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 31so3172528pgy.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X2bDf9/Jh5O4dn/SVRaVejguPnAWqDhOLxYT7jsQ0lo=;
        b=S29hMBzZm/KhA8G3HWd/QdpGC/ll7oRB/rtoB/ePawsHT9ZEni7ZMGlkfSU2W87Jev
         bYKTR3t2KIxoIi2zUHUZLIQdf1yxBAbw4YqzSjbhE025RZol/a/a7Qpz5h6+GHuGdkXH
         5dTZTZNi3vQxdOpyKcOh3eM7/jaN7A66mYCBRsTZAuBoiJxDfouGdkNyYrEK8Www9QLU
         Cf96hq3qpmkoKT8g62sBe0uTcnm3shaUInJwiWjb4RAqd+hoPP4IyGPkLcaeC5nL6Enw
         Z1ul0uCf91GVsRMt1JEWT6xEF4zvI58gWOUCgvybBYPrd3R6ETv9+CBMBCG1e3v7BRtZ
         RBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X2bDf9/Jh5O4dn/SVRaVejguPnAWqDhOLxYT7jsQ0lo=;
        b=Le/olTPPTGAgxcFpSU+YQ90iG/xzDXLp+TIACXOTxtnq+bWTGVzgydAVt2TlmgDI25
         KRvLPeIGrHRiBsnft4zfAm8yBMP78scgNGmoZyiWVGVf21FHb1Pu9tJ2cOvC4nS0QO+9
         AgHpOScXLd9eyow+9qq+X7CmHMkxjF9HRGukgB7YaOzT76unQh9pcFok8FoQwL+TQsXZ
         UDHWpCO/vrjI8NCmmHmoe+NLfWUc0ED7rWNOZfe4g2VmAbx/7evT3u+rCkb4MwtPb3e4
         Ps3/tts/emP/HB42bYd+dQkYGAgrtsYBoqLhwTWQOeryyhMnh36nymE3ADDKytpc7cP5
         urcA==
X-Gm-Message-State: AOAM532XkKwLMWFhom6iAE2atr30n0MrE25XndGZwy8WxTYaXrdOszbz
        +UUdmgv1qQmQ2F4qqk2nPemMXF/9avbTSQ==
X-Google-Smtp-Source: ABdhPJzh7kGfegUrOPIRZY16urZmM3tZ4mq3dsbLyp8UwpLs/4xzGu9bCJxD62qQxhgyhTM+E1bgOg==
X-Received: by 2002:a17:902:7d8c:: with SMTP id a12mr464777plm.327.1598310300089;
        Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j3sm554040pjw.23.2020.08.24.16.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:04:59 -0700 (PDT)
Date:   Mon, 24 Aug 2020 17:04:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 9/9] rpmsg: ns: name service announcement endianness
Message-ID: <20200824230457.GF3938186@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-10-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-10-arnaud.pouliquen@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 31, 2020 at 01:47:32PM +0200, Arnaud Pouliquen wrote:
> The endianness has to be fixed to ensure that both sides can
> decode the message. The Little endian format is used according
> to the generic virtio implementation.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_ns.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index cc2bd47c415a..b478e2b55213 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -33,8 +33,8 @@ enum rpmsg_ns_flags {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	u32 addr;
> -	u32 flags;
> +	__le32 addr;
> +	__le32 flags;
>  } __packed;
>  
>  /**
> @@ -57,8 +57,8 @@ static int rpmsg_ns_channel_announce(struct rpmsg_device *rpdev, int ns_flag)
>  		return -EINVAL;
>  
>  	strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -	nsm.addr = rpdev->ept->addr;
> -	nsm.flags = ns_flag;
> +	nsm.addr = cpu_to_le32(rpdev->ept->addr);
> +	nsm.flags = cpu_to_le32(ns_flag);
>  
>  	return rpmsg_send_offchannel(rpdev->ept, RPMSG_NS_ADDR, RPMSG_NS_ADDR,
>  				     &nsm, sizeof(nsm));
> @@ -84,6 +84,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	struct rpmsg_device *newch;
>  	struct rpmsg_channel_info chinfo;
>  	struct device *dev = &rpdev->dev;
> +	unsigned int flags = le32_to_cpu(msg->flags);
>  	int ret;
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG)
> @@ -101,13 +102,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = msg->addr;
> +	chinfo.dst = le32_to_cpu(msg->addr);
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> -		 msg->name, msg->addr);
> +		 flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> +		 msg->name, chinfo.dst);
>  
> -	if (msg->flags & RPMSG_NS_DESTROY) {
> +	if (flags & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_release_channel(rpdev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);

Please merge this patch to patch 5, I don't see a need for doing this
separately.

Thanks,
Mathieu

> -- 
> 2.17.1
> 
