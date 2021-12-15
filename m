Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A29347661C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Dec 2021 23:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhLOWo5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Dec 2021 17:44:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhLOWo4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Dec 2021 17:44:56 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B4C061401
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Dec 2021 14:44:56 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso6353338ood.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Dec 2021 14:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ugf8VG9mc1i332OpZu+otBgHEDzhuxNnQ5yRaXWRMsA=;
        b=WbH+CziDlrpgyUBc6N9D57Z+hEwJimqrYlS+UAGZi9DKHru0GppcSu7+sA8VgnWFW+
         XYwqRLZJPL3bKA5lXhzjCF76XRbftwMiXmLhr3eCoF7fbvt3+AhmY/JEIkho3Hqvzzlj
         pjUuN8FFE15EuYcRyVyaCEzfUnoUZe+N64nM0YRFkzFSLOw6S7K07F7eKiGihtHfkEgV
         S4ETwkSEjaTL9I6jsrBxF2m/aeGT2qWGnDgVaIFl7Cy29IQhA7LJ0Z7dpRU4RyYsDlMb
         45i5gmTzp0uRe3dEJksmXz+0hcsyG6oNXiG4yAQ/P1KaRqVArgmB0ggKPmH9xXsJo2ft
         uhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ugf8VG9mc1i332OpZu+otBgHEDzhuxNnQ5yRaXWRMsA=;
        b=pQJEOZi0i7be+krqj/0+oPGuoZcXN4QK9aSnJIx1hJ1U1nJsi/8OcpujvKCU0SD/gj
         K8WZibm/altK5RUh589nwRZPd/JWggVQ93v32wdhRR7fS5WXW1ap1oXIhukqXrKSY7cC
         0g5tPn0rCSoiz0oQ+HLGzb7hN1EtPKjf0C5osTCr3ebwAWzyYq+FCvmXa6LHoxPjxXUG
         6Hx92LN1k0xtySYlDQ+9BUonwWdHYPdtsB/j2riHqPfG7HBo++gugzJ7UPUP33EOlvn0
         +3KO0NLbFnJNKYyoiGQf9aUM9E4mXcgZncrF3lXWhRa725ba5PMlruTvUt2hzM35s8sX
         56PQ==
X-Gm-Message-State: AOAM531NqL87cQ980xnhNCvwHA25gkFWGuEXYxudoR/Gs64vhxFcEFJe
        b8HdyatuaoB6Ly+76KYAbHZ/fQ==
X-Google-Smtp-Source: ABdhPJxbEo6DkSroC/wmpKzg8ePiebe2DWXFkjxQ9QA0nlhXnDiE3OA4YLh2zQ63NS8SE0FZcBvZwQ==
X-Received: by 2002:a4a:7d52:: with SMTP id q18mr9124253ooe.52.1639608295370;
        Wed, 15 Dec 2021 14:44:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bf17sm624189oib.27.2021.12.15.14.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:44:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>, vkoul@kernel.org
Cc:     stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mathieu.poirier@linaro.org, ohad@wizery.com, agross@kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom: pas: Add missing power-domain "mxc" for CDSP
Date:   Wed, 15 Dec 2021 16:44:48 -0600
Message-Id: <163960827806.3071514.13463889963656785638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1624559605-29847-1-git-send-email-sibis@codeaurora.org>
References: <1624559605-29847-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 25 Jun 2021 00:03:25 +0530, Sibi Sankar wrote:
> Add missing power-domain "mxc" required by CDSP PAS remoteproc on SM8350
> SoC.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: pas: Add missing power-domain "mxc" for CDSP
      commit: dd585d9bfbf06fd08a6326c82978be1f06e7d1bd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
