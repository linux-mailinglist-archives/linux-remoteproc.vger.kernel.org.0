Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0EACC4DD
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Oct 2019 23:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfJDVhD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Oct 2019 17:37:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34297 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbfJDVhC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Oct 2019 17:37:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id r22so5470270lfm.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 14:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ce3x7KSH0pYsuXm37iytKyn2HOMPOAXSnbAQ/QFaPBo=;
        b=xk9x5ffabqWz4gnsopezWJWtbhnfmkRmyaoteqL0Tb3I0kpN2/0ShNyHmkYndvZ7td
         j2frhivq4Mtp7ruUowc8Hm3Bm/OLGVdXO0NBH4Yrzrv7UQYtxITwYq3kt+t3Fv0XcY87
         ljlrSQ05DQe9wts+tAnYm94cF4NUcOwrjMiIX1uBPL3tYreQukjNLl5naQSsJtb5+Trz
         k5NBV3JBFdekRw8Ma6GEh1gZoXAXm7pDwmso7Yi3PkkByEut/1c0djfEKHMJ1l9REunq
         N0wcHIizgSLdWl4VbUyXoL6Mf9zeMOdPp0AwmRPaBSps+FZwsRBZeSq90WGUVbB7mnQN
         IMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ce3x7KSH0pYsuXm37iytKyn2HOMPOAXSnbAQ/QFaPBo=;
        b=TXtKs5LSTwzPy7eRdSijBv07pHV+eU5mBs/A6ew+IcY0nUH4rMoLsSrAn++VytVqSr
         wpVRe9mZf9F+qZjZt97tynoDL8qFJj/N6BU2SLEuQJKVaLEmXkE5+4fW6A7jNtT00YXU
         DjEiOZS1WJbVS5pZhnFBQ7EVHn5GhnuETG59MWK8RzIHA0hG4HKs2dAS/DUfEFvimCTz
         eqe2I1rzuydLJ8xaLorf/sbYO9fF0/B9tdzseOzd+MkbXSgSRvBSUtSRN7F4CUrr3CWx
         izyEdwQKjsO1W0jh3BRypNM+9WBd9/aiSDjEMuKV8hRBZmXxd1g7RjbkWlVDjmumZCNf
         FT2A==
X-Gm-Message-State: APjAAAWph8PdMfuwjQOLiBV47gLa993WhgbZmnId6kNrVYPFZY0+C1Nb
        layCeBvAdCQ2Y8OQZiEhFfj6FzwpPC/0xjzy3xX95Q==
X-Google-Smtp-Source: APXvYqy4xOAHwIaDtkz8jFtwY47sxQ2nokwcrjmKxbf0EZl8xzeuzKeGyjDOtURFQTzmmkuSB5zJlXy15mbRmL0oGYc=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr10152902lfa.141.1570225019432;
 Fri, 04 Oct 2019 14:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569572448.git.baolin.wang@linaro.org> <c3070351e137bffd2b4b639fb14b1baa19df5641.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <c3070351e137bffd2b4b639fb14b1baa19df5641.1569572448.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:36:48 +0200
Message-ID: <CACRpkdYNXcL3StU4sX2Yyvz5zH1RFr5E6mvAm+1dJFOC5ophxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwspinlock: u8500_hsem: Use devm_kzalloc() to
 allocate memory
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 27, 2019 at 10:28 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Use devm_kzalloc() to allocate memory.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
