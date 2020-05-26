Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273E61DA5F0
	for <lists+linux-remoteproc@lfdr.de>; Wed, 20 May 2020 02:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgETABG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 May 2020 20:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbgETABG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 20:01:06 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96144C061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 17:01:06 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u5so597004pgn.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 17:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E9Zj3t7W1l724bbC9jdXDSbdGf21RCaukKnNr9gZUUg=;
        b=Y5Nj6nCTvVFzL7/LQ9AiAHQ+HwM55i95ib2n73qktWGjb9Y+LkI03Fw35TAc4dyVGU
         k/URuUnQ1uK8uwKDKRSRp6lHtWw+sbvgcwI3x8Vqw+WmCvfZMf24OyhNt2KKcDtejuv2
         GjXu5UTAWW83jbya4z7oV8q7cvtGgzhbE9ARIHxy7RFs6EjbwZjzqVGF7yFvmrq/qFgC
         L2CHprlnLW5izYjn1/4F7CmH8JdimBjqWaJk8lQkjw4EIVHDczCwI7Z4tOnTwij2P9Rd
         5DP0DJsE9BIkWVZOS2PND5Wdsl8qdOuJJzE3Ax6dITDutuuWf/3uPSz7+pRUEGRmugmQ
         oIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E9Zj3t7W1l724bbC9jdXDSbdGf21RCaukKnNr9gZUUg=;
        b=GKIsGbWZhv4TQ5WKAp7IdJ9OGxWtdF7KXIVoc5gW0fSlMH2h5eAsuRLS71yFDfgjwE
         iY5+bbauXdQ7tLIsSIpjaoMjNqycXTPpH4hE6eBUrgfc44JzVhYk5KNJN/eiJU3216U6
         RXVNhEjX1fpcE/priri67+ht4BlYWo9HU41w+THlPpG4ggKu4yrhejVnJep+R8Tb5M0L
         jNlw2EQemQEOFj4oW55IOyWYC8VS/9FyHxaOkFNy3V1rlp2tC7wEHfXS+dIq14s11gJ6
         fp14eNdrPZrsYRJ3sP+vF7NC9LGxBEKXr/ExmvJCnUBa/kbEEcsNZJ1sUuYvpRybKrJl
         JxNw==
X-Gm-Message-State: AOAM532yzE+dGKgisIzf1mQLLXdZGYzTGLkp8ONsd64dYfs8D8wUzyX/
        q8xHExEXafnSOWCieYHLki7vRA==
X-Google-Smtp-Source: ABdhPJwxjHPtDILEliHZT1xZXervKwjgwUoiv4JJps64ggl6VAUl/s+ffwyaRi+YzNtWPRskTrDeAg==
X-Received: by 2002:a62:641:: with SMTP id 62mr1509420pfg.283.1589932865735;
        Tue, 19 May 2020 17:01:05 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a71sm538747pje.0.2020.05.19.17.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 17:01:05 -0700 (PDT)
Date:   Tue, 19 May 2020 16:59:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 2/3] remoteproc: Add inline coredump functionality
Message-ID: <20200519235944.GF408178@builder.lan>
References: <1589486856-23440-1-git-send-email-rishabhb@codeaurora.org>
 <1589486856-23440-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589486856-23440-3-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 14 May 13:07 PDT 2020, Rishabh Bhatnagar wrote:

> The current coredump implementation uses vmalloc area to copy
> all the segments. But this might put strain on low memory targets
> as the firmware size sometimes is in tens of MBs. The situation
> becomes worse if there are multiple remote processors undergoing
> recovery at the same time. This patch adds inline coredump
> functionality that avoids extra memory usage. This requires
> recovery to be halted until data is read by userspace and free
> function is called.
> 

Overall I think this looks really good now, but I spotted an issue with
INLINE dumps not using segment->dump().

Also there's 3 checkpatch --strict warnings, please fix those.

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_coredump.c | 129 +++++++++++++++++++++++++++++--
>  include/linux/remoteproc.h               |  15 ++++
>  2 files changed, 139 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
[..]
> +static ssize_t rproc_coredump_read(char *buffer, loff_t offset, size_t count,
> +				    void *data, size_t header_sz)
> +{
> +	void *device_mem;
> +	size_t seg_data;
> +	size_t copy_sz, bytes_left = count;
> +	unsigned long addr;
> +	struct rproc_coredump_state *dump_state = data;
> +	struct rproc *rproc = dump_state->rproc;
> +	void *elfcore = dump_state->header;
> +
> +	/* Copy the vmalloc'ed header first. */
> +	if (offset < header_sz) {
> +		copy_sz = memory_read_from_buffer(buffer, count, &offset,
> +						  elfcore, header_sz);
> +		if (copy_sz < 0)
> +			return -EINVAL;
> +
> +		return copy_sz;
> +	}
> +
> +	/* Find out the segment memory chunk to be copied based on offset.
> +	 * Keep copying data until count bytes are read.
> +	 */

	/*
	 * Multiline comments start on the second line throughout
	 * remoteproc, please follow this.
	 */

> +	while (bytes_left) {
> +		addr = rproc_coredump_find_segment(offset - header_sz,
> +						   &rproc->dump_segments,
> +						   &seg_data);
> +		/* EOF check */
> +		if (seg_data == 0) {
> +			dev_info(&rproc->dev, "Ramdump done, %lld bytes read",
> +				 offset);
> +			break;
> +		}
> +
> +		copy_sz = min_t(size_t, bytes_left, seg_data);
> +
> +		device_mem = rproc_da_to_va(rproc, addr, copy_sz);
> +		if (!device_mem) {
> +			dev_err(&rproc->dev, "Coredump: %lx with size %zd out of remoteproc carveout\n",
> +				addr, copy_sz);
> +			return -ENOMEM;

I think it would be best to maintain the same behavior between INLINE
and DEFAULT here.

> +		}
> +		memcpy(buffer, device_mem, copy_sz);

This won't work for modem on e.g. SDM845, because we need to do some
special tricks to make the memory readable, that's why we invoke
segment->dump() in the DEFAULT scenario. Doing a memcpy here instead
will result in a security violation.

Perhaps this snippet can be extracted to a separate helper function,
which would allow you to avoid the next_seg goto label below.

> +
> +		offset += copy_sz;
> +		buffer += copy_sz;
> +		bytes_left -= copy_sz;
> +	}
> +
> +	return count - bytes_left;
> +}
[..]
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 0468be4..ab2b9b7 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -435,6 +435,19 @@ enum rproc_crash_type {
>  };
>  
>  /**
> + * enum rproc_dump_mechanism - Coredump options for core
> + * @COREDUMP_DEFAULT:	Copy dump to separate buffer and carry on with recovery
> + * @COREDUMP_INLINE:	Read segments directly from device memory. Stall
> +			recovery until all segments are read
> + * @COREDUMP_DISABLED:	Don't perform any dump
> + */
> +enum rproc_dump_mechanism {
> +	COREDUMP_DEFAULT,
> +	COREDUMP_INLINE,
> +	COREDUMP_DISABLED,

Please prefix these with RPROC_, as "coredump" has a meaning outside
remoteproc as well.

Regards,
Bjorn
