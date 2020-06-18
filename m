Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F3F1FFE67
	for <lists+linux-remoteproc@lfdr.de>; Fri, 19 Jun 2020 01:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgFRXAc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Jun 2020 19:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgFRXA3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Jun 2020 19:00:29 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AED1C0613EE
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2020 16:00:29 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id z2so7610193ilq.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2020 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vexadp3DjsMOuVAfFzbe7nXhBs4dWuB3dE8TJtjybg0=;
        b=VQltBKp9ItrEnG6UwkqkL3U5U1GJOYwbgfEes0Rl9BBj8Q8VpaQAWp8Nq7TM3tjqUQ
         aJgO+8K6xD0YIxMLNlbXEg2eQ7f3WOkk5r98sPRnexDNgxO/LMavEb93SUW1PafqV49X
         b6uu1GeRJ9lvbEhfWbxqCqExewjJQRGvWQGEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vexadp3DjsMOuVAfFzbe7nXhBs4dWuB3dE8TJtjybg0=;
        b=S/7riTDnmbxxUMQ/QXNRajfe9apYEhLDY4ARFvQA75DukEkbeYbw6K3v++YNcc7HCC
         2R4LS0iU8vMviqc44m7/bHs869eJUgpFOVMk/gRtD0orqEYrDomHGiUXKqX8SMSKWbv2
         FRNgbzWf41/W/0GG0FhysNTfTGnvVDSbmbrTfD0Y2sf7ptn9LBUFXIFsmZuvGzGadFvJ
         Y0jjs4c8c3ez0ASvDp1RAMskUoU2TnI97g+2PmH/zSBBEReQyy4QiEHv2vI5pxEpyBK3
         S2O6FMoe8FalmXtUYRqNORGF9273EXQLPwnlt8K/ULjSE6J7vZ9haVFDtRIuBQG3q0+A
         nWcQ==
X-Gm-Message-State: AOAM530zLwDZXMRHCRsDMUPaJsswMrJLbxVDEsbqSbRMRCV/ayEpxA0M
        rtHvpinHBOec7iq/w3E17asnGw==
X-Google-Smtp-Source: ABdhPJxh35jaQaacmI6osbCV9DNhjEnABfgyasTHqbR/XO2jKqsgAz831QkwNCLqpNSvH2NnOtW0TA==
X-Received: by 2002:a92:db49:: with SMTP id w9mr797911ilq.188.1592521228530;
        Thu, 18 Jun 2020 16:00:28 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id r2sm1784478iop.34.2020.06.18.16.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 16:00:27 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] remoteproc: qcom: Add per subsystem SSR
 notification
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
References: <1590636883-30866-1-git-send-email-rishabhb@codeaurora.org>
 <1590636883-30866-2-git-send-email-rishabhb@codeaurora.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <5f258ccc-46db-50fe-61fd-d7959deb4989@ieee.org>
Date:   Thu, 18 Jun 2020 18:00:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590636883-30866-2-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/27/20 10:34 PM, Rishabh Bhatnagar wrote:
> Currently there is a single notification chain which is called whenever any
> remoteproc shuts down. This leads to all the listeners being notified, and
> is not an optimal design as kernel drivers might only be interested in
> listening to notifications from a particular remoteproc. Create a global
> list of remoteproc notification info data structures. This will hold the
> name and notifier_list information for a particular remoteproc. The API
> to register for notifications will use name argument to retrieve the
> notification info data structure and the notifier block will be added to
> that data structure's notification chain. Also move from blocking notifier
> to srcu notifer based implementation to support dynamic notifier head
> creation.

I'm looking at these patches now, without having reviewed the
previous versions.  Forgive me if I contradict or duplicate
previous feedback.

I have a number of suggestions, below.

					-Alex

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>   drivers/remoteproc/qcom_common.c      | 84 ++++++++++++++++++++++++++++++-----
>   drivers/remoteproc/qcom_common.h      |  5 ++-
>   include/linux/remoteproc/qcom_rproc.h | 20 ++++++---
>   3 files changed, 90 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 9028cea..61ff2dd 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -12,6 +12,7 @@
>   #include <linux/module.h>
>   #include <linux/notifier.h>
>   #include <linux/remoteproc.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>   #include <linux/rpmsg/qcom_glink.h>
>   #include <linux/rpmsg/qcom_smd.h>
>   #include <linux/soc/qcom/mdt_loader.h>
> @@ -23,7 +24,14 @@
>   #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
>   #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
>   
> -static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> +struct qcom_ssr_subsystem {
> +	const char *name;
> +	struct srcu_notifier_head notifier_list;
> +	struct list_head list;
> +};
> +
> +static LIST_HEAD(qcom_ssr_subsystem_list);
> +DEFINE_MUTEX(qcom_ssr_subsys_lock);

There is no need for this mutex to be global.

>   static int glink_subdev_start(struct rproc_subdev *subdev)
>   {
> @@ -189,39 +197,79 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>   }
>   EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
>   
> +struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)

This function should be made private (static).

I think the mutex should be taken in this function rather than
the caller (more on this below).  But if you leave it this way,
please mention something in a comment that indicates the caller
must hold the qcom_ssr_subsys_lock mutex.

> +{
> +	struct qcom_ssr_subsystem *info;
> +
> +	/* Match in the global qcom_ssr_subsystem_list with name */
> +	list_for_each_entry(info, &qcom_ssr_subsystem_list, list) {
> +		if (!strcmp(info->name, name))
> +			return info;

This probably isn't strictly necessary, because you are
returning a void pointer, but you could do this here:
			return ERR_CAST(info);

> +	}

This is purely a style thing, but the curly braces around
the loop body aren't necessary.

> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +	info->name = kstrdup_const(name, GFP_KERNEL);
> +	srcu_init_notifier_head(&info->notifier_list);
> +
> +	/* Add to global notif list */

s/notif/notification/

> +	INIT_LIST_HEAD(&info->list);

No need to initialize the list element when adding it
to a list.  Both uts fields will be overwritten anyway.

> +	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
> +
> +	return info;
> +}
> +
>   /**
>    * qcom_register_ssr_notifier() - register SSR notification handler
> + * @name:	name that will be searched in global ssr subsystem list

Maybe just "SSR subsystem name".

>    * @nb:		notifier_block to notify for restart notifications

Drop or modify "restart" in the comment line above.

>    *
> - * Returns 0 on success, negative errno on failure.
> + * Returns a subsystem cookie on success, ERR_PTR on failure.

Maybe make the above a @Return: comment.

>    *
> - * This register the @notify function as handler for restart notifications. As
> - * remote processors are stopped this function will be called, with the SSR
> - * name passed as a parameter.
> + * This registers the @nb notifier block as part the notifier chain for a
> + * remoteproc associated with @name. The notifier block's callback
> + * will be invoked when the particular remote processor is stopped.

It's not just for stopping, right?  Maybe something
more like:
   Register to receive notification callbacks when
   remoteproc SSR events occur (pre- and post-startup
   and pre- and post-shutdown).

>    */
> -int qcom_register_ssr_notifier(struct notifier_block *nb)
> +void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
>   {
> -	return blocking_notifier_chain_register(&ssr_notifiers, nb);
> +	struct qcom_ssr_subsystem *info;
> +
> +	mutex_lock(&qcom_ssr_subsys_lock);

Can you explain why the mutex is taken here (and in
qcom_add_ssr_subdev()), rather than having the mutex
logic be isolated in qcom_ssr_get_subsys()?

> +	info = qcom_ssr_get_subsys(name);
> +	if (IS_ERR(info)) {
> +		mutex_unlock(&qcom_ssr_subsys_lock);
> +		return info;
> +	}

I don't think there's any need to have the next function
call be protected by the mutex, but maybe I'm mistaken.

> +	srcu_notifier_chain_register(&info->notifier_list, nb);
> +	mutex_unlock(&qcom_ssr_subsys_lock);
> +	return &info->notifier_list;
>   }
>   EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
>   
>   /**
>    * qcom_unregister_ssr_notifier() - unregister SSR notification handler
> + * @notify:	subsystem coookie returned from qcom_register_ssr_notifier
>    * @nb:		notifier_block to unregister

Add a @Return comment (0 on success, %ENOENT otherwise).

>    */
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb)
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>   {
> -	blocking_notifier_chain_unregister(&ssr_notifiers, nb);
> +	return srcu_notifier_chain_unregister(notify, nb);
>   }
>   EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>   
>   static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>   {
>   	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
>   
> -	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr->name);
> +	srcu_notifier_call_chain(&ssr->info->notifier_list, 0, &data);
>   }
>   
> +
>   /**
>    * qcom_add_ssr_subdev() - register subdevice as restart notification source
>    * @rproc:	rproc handle
> @@ -229,12 +277,23 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>    * @ssr_name:	identifier to use for notifications originating from @rproc
>    *
>    * As the @ssr is registered with the @rproc SSR events will be sent to all
> - * registered listeners in the system as the remoteproc is shut down.
> + * registered listeners for the particular remoteproc when it is shutdown.
>    */
>   void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>   			 const char *ssr_name)
>   {
> -	ssr->name = ssr_name;
> +	struct qcom_ssr_subsystem *info;
> +
> +	mutex_lock(&qcom_ssr_subsys_lock);
> +	info = qcom_ssr_get_subsys(ssr_name);

If there already exists an SSR subsystem having the given
name, its info structure is returned here.  Is that OK?
In practice, I don't expect this to be a problem, but it
would be better to return an error if

> +	if (IS_ERR(info)) {
> +		dev_err(&rproc->dev, "Failed to add ssr subdevice\n");
> +		mutex_unlock(&qcom_ssr_subsys_lock);
> +		return;
> +	}
> +
> +	mutex_unlock(&qcom_ssr_subsys_lock);
> +	ssr->info = info;
>   	ssr->subdev.unprepare = ssr_notify_unprepare;
>   
>   	rproc_add_subdev(rproc, &ssr->subdev);
> @@ -249,6 +308,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>   void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>   {
>   	rproc_remove_subdev(rproc, &ssr->subdev);
> +	ssr->info = NULL;
>   }
>   EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
>   
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index 34e5188..dfc641c 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -26,10 +26,11 @@ struct qcom_rproc_subdev {
>   	struct qcom_smd_edge *edge;
>   };
>   
> +struct qcom_ssr_subsystem;
> +
>   struct qcom_rproc_ssr {
>   	struct rproc_subdev subdev;
> -
> -	const char *name;
> +	struct qcom_ssr_subsystem *info;
>   };
>   
>   void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index fa8e386..58422b1 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -5,17 +5,27 @@
>   
>   #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
>   
> -int qcom_register_ssr_notifier(struct notifier_block *nb);
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb);
> +struct qcom_ssr_notif_data {
> +	const char *name;
> +	bool crashed;

Is the crashed field strictly necessary?  Could we instead have
a QCOM_SSR_CRASHED event (in place of QCOM_SSR_BEFORE_SHUTDOWN)?
I don't know, it's possible doing it the way you do ultimately
simplifies the logic...  So I'm asking, but not suggesting.

> +};
> +
> +void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>   
>   #else
>   
> -static inline int qcom_register_ssr_notifier(struct notifier_block *nb)
> +static inline void *qcom_register_ssr_notifier(const char *name,
> +					       struct notifier_block *nb)
>   {
> -	return 0;
> +	return NULL;
>   }
>   
> -static inline void qcom_unregister_ssr_notifier(struct notifier_block *nb) {}
> +static inline int qcom_unregister_ssr_notifier(void *notify,
> +					       struct notifier_block *nb)
> +{
> +	return 0;
> +}
>   
>   #endif
>   
> 

