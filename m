Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5656CAEB5
	for <lists+linux-remoteproc@lfdr.de>; Mon, 27 Mar 2023 21:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjC0TfH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 27 Mar 2023 15:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjC0TfG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 15:35:06 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E941736
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 12:35:04 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id eg48so40580086edb.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679945702;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rAw6XJ1fgnGt+Qt//vZMySIcxRN5BjqGMW61n6KkE4o=;
        b=m2iy7Xy3jVqU+tO5YusakE9NsiZbvYHloJaBcOiNnBH+beCr9j4+unXFsPJQxioy1z
         P+SuBwYoqt8xh01YtYGPKkzDHLvFA6wrKzhoYVrDN/yLeMcLtj4jIL4tPMiUUEFOueq4
         jnp3i+sT0eaCdQ2Nqxlaa1PvTpSzQ7bqYz7O+1c466AcV/FcXjjyfrABoFZVlgPKV8iO
         ho1eAbB17x457eRLCUpZXiRyDTQrjdv6DRyHUoa0N3+A1oXzCcyzHst95+5QBubs8EJC
         7QBVMV/O4agQEk5S7jtVF3ApTN1WdBNwyrpPY1xRtnXALpWhffCoeFzKS7mmGuXLomAR
         NF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679945702;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAw6XJ1fgnGt+Qt//vZMySIcxRN5BjqGMW61n6KkE4o=;
        b=6/WdVc+U0NQPQx7BKmInDexlzmxIKrKIhTkYYTwy8cYvdrrkJKkd8z8XflIGpnja+Z
         KOgXhwfUd7ZwSmt0jv2kzKgZs6h8O54hGv0Ff7Je9vt39wCzTyFyfDR88iSjJ8MZZlvW
         +VDno6tvO+R3IyRjtq4WhyEL649VyOB9mDWuhvaROGgfPz+Ui7ooenWGfu9nWWJjEYTF
         WjY6dMyz4J05Chzpk8YnXBDERNT1LSP7DYh9a7ucslb6Ed7IOL4W/ewwsfRAp/ig6znI
         U2+l9Us8situTqG6Q5zEDtldB9WBL/SXtonXkaDHd4HNPfaZWOOg8UHE9coDNhGw4rq/
         pzUQ==
X-Gm-Message-State: AAQBX9crIq58rBovi35ViPFxYalq506WOYsSwP3hK9eNRWPCPTWDX4sZ
        Y6uk/G5TEubcl/VSliuEbGXbU2hYWJ43UpHAYoc=
X-Google-Smtp-Source: AKy350b8JLnbeiyREbGKeLCXB834bizQhV90xQMHiSbKigkIqhHjlh2gk5O5nu1jkcnImy+sBG3EcK3fDzg6FtY3at0=
X-Received: by 2002:a17:907:2152:b0:888:b471:8e18 with SMTP id
 rk18-20020a170907215200b00888b4718e18mr5845444ejb.8.1679945702374; Mon, 27
 Mar 2023 12:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:5583:b0:65:ee66:643d with HTTP; Mon, 27 Mar 2023
 12:35:01 -0700 (PDT)
From:   Daniel Ndoye <fcr423384@gmail.com>
Date:   Mon, 27 Mar 2023 19:35:01 +0000
Message-ID: <CAJYHccwVB5c9CUSQhDwRMKnZdE87QzXD9j1EF5ntzSh4gezRYg@mail.gmail.com>
Subject: We shall stand in understanding
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=ADVANCE_FEE_2_NEW_FORM,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:541 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fcr423384[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fcr423384[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  2.0 FILL_THIS_FORM_LONG Fill in a form with personal information
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.0 ADVANCE_FEE_2_NEW_FORM Advance Fee fraud and a form
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

We shall stand in understanding.

Would you be interested in handling a good deal worth more than
Millions of dollars.
   Please Permit to tell you this this transaction is 100% risk free
as I legitimately I am a banker and during our periodic audits last we
discovered dormant accounts with holding balances.
  I hoping you will cooperate with me as a partner in a project of
transferring an abandoned fund.
Am confident that it will be of great benefit to both of us. How we'll
realize this fund. Please contact me via below with your details.

Full Name and Address
Occupation
Country of Origin
Cellphone Number

Regards.
Daniel Ndoye
