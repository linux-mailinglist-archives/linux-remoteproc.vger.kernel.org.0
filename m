Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4930F2239FA
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 13:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGQLEj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 07:04:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48279 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbgGQLEh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:04:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594983876; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0DmSjSPRq4xd/aP1wnIbOfBMiq8D4Hd2kw25xMXQkrE=;
 b=H5Z5rRcvVf+e3kAt4JBwkDkWhD0mFs7Q2LVHPgpnveTsSpRfx+H9Jlx36cs5EcFih64qu7nt
 kaTsJC342zKgsuHoWSCOB4D2LNFzWC3yKTMPypA4U4TRBj+qRTfD6F9p8NY2EiuYN65iZ+SI
 WmxloIvcQImmfLHkTV1ETX6wtxc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f118596d3d65084227a09f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 11:03:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5428C43391; Fri, 17 Jul 2020 11:03:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F024C433C9;
        Fri, 17 Jul 2020 11:03:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Jul 2020 16:33:48 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sibis@codearora.org, tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v8 4/5] remoteproc: Add inline coredump functionality
In-Reply-To: <1594938035-7327-5-git-send-email-rishabhb@codeaurora.org>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
 <1594938035-7327-5-git-send-email-rishabhb@codeaurora.org>
Message-ID: <522fc74e07dec26e398f238bd233c778@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-07-17 03:50, Rishabh Bhatnagar wrote:
> The current coredump implementation uses vmalloc area to copy
> all the segments. But this might put strain on low memory targets
> as the firmware size sometimes is in tens of MBs. The situation
> becomes worse if there are multiple remote processors undergoing
> recovery at the same time. This patch adds inline coredump
> functionality that avoids extra memory usage. This requires
> recovery to be halted until data is read by userspace and free
> function is called.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> Tested-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_coredump.c | 156 
> +++++++++++++++++++++++++++----
>  include/linux/remoteproc.h               |  16 ++++
>  2 files changed, 154 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c
> b/drivers/remoteproc/remoteproc_coredump.c
> index 390f563..bb15a29 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   */
> 
> +#include <linux/completion.h>
>  #include <linux/devcoredump.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> @@ -12,6 +13,12 @@
>  #include "remoteproc_internal.h"
>  #include "remoteproc_elf_helpers.h"
> 
> +struct rproc_coredump_state {
> +	struct rproc *rproc;
> +	void *header;
> +	struct completion dump_done;
> +};
> +
>  /**
>   * rproc_coredump_cleanup() - clean up dump_segments list
>   * @rproc: the remote processor handle
> @@ -115,12 +122,110 @@ int rproc_coredump_set_elf_info(struct rproc
> *rproc, u8 class, u16 machine)
>  }
>  EXPORT_SYMBOL(rproc_coredump_set_elf_info);
> 
> +static void rproc_coredump_free(void *data)
> +{
> +	struct rproc_coredump_state *dump_state = data;
> +
> +	vfree(dump_state->header);
> +	complete(&dump_state->dump_done);
> +}
> +
> +static void *rproc_coredump_find_segment(loff_t user_offset,
> +					 struct list_head *segments,
> +					 size_t *data_left)
> +{
> +	struct rproc_dump_segment *segment;
> +
> +	list_for_each_entry(segment, segments, node) {
> +		if (user_offset < segment->size) {
> +			*data_left = segment->size - user_offset;
> +			return segment;
> +		}
> +		user_offset -= segment->size;
> +	}
> +
> +	*data_left = 0;
> +	return NULL;
> +}
> +
> +static void rproc_copy_segment(struct rproc *rproc, void *dest,
> +			       struct rproc_dump_segment *segment,
> +			       size_t offset, size_t size)
> +{
> +	void *ptr;
> +
> +	if (segment->dump) {
> +		segment->dump(rproc, segment, dest, offset, size);
> +	} else {
> +		ptr = rproc_da_to_va(rproc, segment->da + offset, size);
> +		if (!ptr) {
> +			dev_err(&rproc->dev,
> +				"invalid copy request for segment %pad with offset %zu and size 
> %zu)\n",
> +				&segment->da, offset, size);
> +			memset(dest, 0xff, size);
> +		} else {
> +			memcpy(dest, ptr, size);
> +		}
> +	}
> +}
> +
> +static ssize_t rproc_coredump_read(char *buffer, loff_t offset, size_t 
> count,
> +				   void *data, size_t header_sz)
> +{
> +	size_t seg_data, bytes_left = count;
> +	ssize_t copy_sz;
> +	struct rproc_dump_segment *seg;
> +	struct rproc_coredump_state *dump_state = data;
> +	struct rproc *rproc = dump_state->rproc;
> +	void *elfcore = dump_state->header;
> +
> +	/* Copy the vmalloc'ed header first. */
> +	if (offset < header_sz) {
> +		copy_sz = memory_read_from_buffer(buffer, count, &offset,
> +						  elfcore, header_sz);
> +
> +		return copy_sz;
> +	}
> +
> +	/*
> +	 * Find out the segment memory chunk to be copied based on offset.
> +	 * Keep copying data until count bytes are read.
> +	 */
> +	while (bytes_left) {
> +		seg = rproc_coredump_find_segment(offset - header_sz,
> +						  &rproc->dump_segments,
> +						  &seg_data);
> +		/* EOF check */
> +		if (!seg) {
> +			dev_info(&rproc->dev, "Ramdump done, %lld bytes read",
> +				 offset);
> +			break;
> +		}
> +
> +		copy_sz = min_t(size_t, bytes_left, seg_data);
> +
> +		rproc_copy_segment(rproc, buffer, seg, seg->size - seg_data,
> +				   copy_sz);
> +
> +		offset += copy_sz;
> +		buffer += copy_sz;
> +		bytes_left -= copy_sz;
> +	}
> +
> +	return count - bytes_left;
> +}
> +
>  /**
>   * rproc_coredump() - perform coredump
>   * @rproc:	rproc handle
>   *
>   * This function will generate an ELF header for the registered 
> segments
> - * and create a devcoredump device associated with rproc.
> + * and create a devcoredump device associated with rproc. Based on the
> + * coredump configuration this function will directly copy the 
> segments
> + * from device memory to userspace or copy segments from device memory 
> to
> + * a separate buffer, which can then be read by userspace.
> + * The first approach avoids using extra vmalloc memory. But it will 
> stall
> + * recovery flow until dump is read by userspace.
>   */
>  void rproc_coredump(struct rproc *rproc)
>  {
> @@ -130,11 +235,13 @@ void rproc_coredump(struct rproc *rproc)
>  	size_t data_size;
>  	size_t offset;
>  	void *data;
> -	void *ptr;
>  	u8 class = rproc->elf_class;
>  	int phnum = 0;
> +	struct rproc_coredump_state dump_state;
> +	enum rproc_dump_mechanism dump_conf = rproc->dump_conf;
> 
> -	if (list_empty(&rproc->dump_segments))
> +	if (list_empty(&rproc->dump_segments) ||
> +	    dump_conf == RPROC_COREDUMP_DISABLED)
>  		return;
> 
>  	if (class == ELFCLASSNONE) {
> @@ -144,7 +251,14 @@ void rproc_coredump(struct rproc *rproc)
> 
>  	data_size = elf_size_of_hdr(class);
>  	list_for_each_entry(segment, &rproc->dump_segments, node) {
> -		data_size += elf_size_of_phdr(class) + segment->size;
> +		/*
> +		 * For default configuration buffer includes headers & segments.
> +		 * For inline dump buffer just includes headers as segments are
> +		 * directly read from device memory.
> +		 */
> +		data_size += elf_size_of_phdr(class);
> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
> +			data_size += segment->size;
> 
>  		phnum++;
>  	}
> @@ -183,23 +297,29 @@ void rproc_coredump(struct rproc *rproc)
>  		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
>  		elf_phdr_set_p_align(class, phdr, 0);
> 
> -		if (segment->dump) {
> -			segment->dump(rproc, segment, data + offset, 0, segment->size);
> -		} else {
> -			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
> -			if (!ptr) {
> -				dev_err(&rproc->dev,
> -					"invalid coredump segment (%pad, %zu)\n",
> -					&segment->da, segment->size);
> -				memset(data + offset, 0xff, segment->size);
> -			} else {
> -				memcpy(data + offset, ptr, segment->size);
> -			}
> -		}
> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
> +			rproc_copy_segment(rproc, data + offset, segment, 0,
> +					   segment->size);
> 
>  		offset += elf_phdr_get_p_filesz(class, phdr);
>  		phdr += elf_size_of_phdr(class);
>  	}
> +	if (dump_conf == RPROC_COREDUMP_DEFAULT) {
> +		dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
> +		return;
> +	}
> +
> +	/* Initialize the dump state struct to be used by rproc_coredump_read 
> */
> +	dump_state.rproc = rproc;
> +	dump_state.header = data;
> +	init_completion(&dump_state.dump_done);
> +
> +	dev_coredumpm(&rproc->dev, NULL, &dump_state, data_size, GFP_KERNEL,
> +		      rproc_coredump_read, rproc_coredump_free);
> 
> -	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
> +	/*
> +	 * Wait until the dump is read and free is called. Data is freed
> +	 * by devcoredump framework automatically after 5 minutes.
> +	 */
> +	wait_for_completion(&dump_state.dump_done);
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index eb08139..38d037d 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -435,6 +435,20 @@ enum rproc_crash_type {
>  };
> 
>  /**
> + * enum rproc_dump_mechanism - Coredump options for core
> + * @RPROC_COREDUMP_DEFAULT:	Copy dump to separate buffer and carry on 
> with
> +				recovery
> + * @RPROC_COREDUMP_INLINE:	Read segments directly from device memory. 
> Stall
> +				recovery until all segments are read
> + * @RPROC_COREDUMP_DISABLED:	Don't perform any dump
> + */
> +enum rproc_dump_mechanism {
> +	RPROC_COREDUMP_DEFAULT,
> +	RPROC_COREDUMP_INLINE,
> +	RPROC_COREDUMP_DISABLED,
> +};
> +
> +/**
>   * struct rproc_dump_segment - segment info from ELF header
>   * @node:	list node related to the rproc segment list
>   * @da:		device address of the segment
> @@ -466,6 +480,7 @@ struct rproc_dump_segment {
>   * @dev: virtual device for refcounting and common remoteproc behavior
>   * @power: refcount of users who need this rproc powered up
>   * @state: state of the device
> + * @dump_conf: Currently selected coredump configuration
>   * @lock: lock which protects concurrent manipulations of the rproc
>   * @dbg_dir: debugfs directory of this rproc device
>   * @traces: list of trace buffers
> @@ -499,6 +514,7 @@ struct rproc {
>  	struct device dev;
>  	atomic_t power;
>  	unsigned int state;
> +	enum rproc_dump_mechanism dump_conf;
>  	struct mutex lock;
>  	struct dentry *dbg_dir;
>  	struct list_head traces;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
